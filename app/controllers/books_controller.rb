class BooksController < ApplicationController
  def new
  end

  def create
    render plain: params[:book].inspect
  end

end
