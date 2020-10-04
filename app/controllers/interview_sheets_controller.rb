class InterviewSheetsController < ApplicationController
  def index
    @interview_sheets = InterviewSheet.all.order(id: "ASC")
  end

  def show
    @interview_sheet = InterviewSheet.find(params[:id])
  end
end