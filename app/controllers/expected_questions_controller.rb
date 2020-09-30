class ExpectedQuestionsController < ApplicationController
  before_action :correct_user, only: %i[show edit update]

  def index
    @expected_questions = ExpectedQuestion.where(user_id: current_user.id).order(id: "ASC")
  end

  def show
    @expected_question = ExpectedQuestion.find(params[:id])
  end

  def create
    current_user.expected_questions.create!(title: create_params[:title], content: create_params[:content])
    redirect_to expected_questions_path
  end

  def edit
    @expected_question = ExpectedQuestion.find(params[:id])
  end

  def update
    @expected_question = ExpectedQuestion.find(params[:id])
    if @expected_question.update!(expected_question_params)
      redirect_to expected_questions_path, notice: '編集が完了しました'
    else
      flash[:alert] = 'Save error'
      render :edit
    end
  end



  private
  def create_params
    params.permit(:title, :content)
  end

  def expected_question_params
    params.require(:expected_question).permit(:title, :content)
  end

  def correct_user
    @expected_question = current_user.expected_questions.find_by(id: params[:id])
    redirect_to expected_question_path, alert: '他の受講生のページは閲覧できません'  if @expected_question.nil?
  end

end