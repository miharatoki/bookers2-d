class SearchsController < ApplicationController
  
  def search
    @books = Book.looks(params[:word])
    @book = Book.new
  end
  
end