class TextsController < ApplicationController
  def index
    @texts = Text.all.order(id: "ASC")
  end

  def show
    @text = Text.find(params[:id])
  end

end