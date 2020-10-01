class DocumentsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  
  def index
    @documents = Document.all.order(id: "DESC")
  end

  def show
    @document = Document.find(params[:id])
    @correction = Correction.new
    # @user = @corrections.user
  end

  def create
    current_user.documents.create!(title: create_params[:title], content: create_params[:content])
    redirect_to documents_path
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update!(document_params)
      redirect_to documents_path, notice: '編集が完了しました'
    else
      flash[:alert] = 'Save error'
      render :edit
    end
  end

  def destroy

    # @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path, notice: '削除が完了しました'
  end

  private
  def create_params
    params.permit(:title, :content)
  end

  def document_params
    params.require(:document).permit(:title, :content)
  end

  def correct_user
    @document = current_user.documents.find_by(id: params[:id])
    redirect_to document_path, alert: '他の受講生の書類は変更できません'  if @document.nil?
  end
end