class ExpectedQuestionsController < ApplicationController
  def index
    @expected_questions = ExpectedQuestion.all
  end

  def show
    @expected_question = ExpectedQuestion.find(params[:id])
  end

end