class InterviewSheetsController < ApplicationController
  def index
    @interview_sheets = InterviewSheet.all
  end

  def show
    @interview_sheet = InterviewSheet.find(params[:id])
  end
end