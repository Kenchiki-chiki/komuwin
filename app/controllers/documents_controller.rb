class DocumentsController < ApplicationController
  
  def index
    @documents = Document.all.order(id: "DESC")
  end

  def show
    @document = Document.find(params[:id])
    @correction = Correction.new
  end

  def create
    Document.create!(title: create_params[:title], content: create_params[:content])
    redirect_to documents_path
  end

  private
  def create_params
    params.permit(:title, :content)
  end
end