class SearchsController < ApplicationController
  def search
    @word = params[:word]
    @books = Book.looks(params[:word])
    @book = Book.new
  end
  
end