# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    
    # approval?とすることで返ってくるtrueかfalseをdecisionに入れる
    decision = approval?(params[:user][:slack_id])
    # decisionがtrueであれば、deviseの新規登録機能が実行される
    if decision
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      # 問題がある場合の対処
      flash[:alert] = "入力された Slack メンバー ID は存在しません"
      render :new
    end
  end


  private
  
  def approval?(slack_id)
    # credentials.ymlに埋め込んだトークンを使ってSlalckワークスペースの情報を呼び出し、clientに格納する
    client = Slack::Web::Client.new(token: Rails.application.credentials.dig(:slack, :oauth_token))
    # users_infoメソッドを実行することで、引数として受け取ったslack_idをもつユーザーをuserに格納する  
    user = client.users_info(user: slack_id).user
    # Slack_idが存在するけれどもユーザーが削除されていたりbotでないかを調べ、問題なければメソッドの呼び出しもとにtrueを返す
    !user.deleted && !user.is_bot
    # users_infoメソッドは見つからない場合にエラーが出てしまうので、その対処をする
  rescue Slack::Web::Api::Errors::UserNotFound
    false
  end

end