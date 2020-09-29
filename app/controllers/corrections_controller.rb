class CorrectionsController < ApplicationController
  def create
    @document = Document.find(params[:document_id])
    # binding.pry
    @user = current_user.corrections.create!(document_id: correction_params[:document_id], content: correction_params[:correction][:content])
    redirect_to document_path(@document)
  end

  

  private
  def correction_params
    params.permit(:document_id, correction: [:content])
  end

end