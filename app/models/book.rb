class Book < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	belongs_to :user

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
  
  def self.looks(searchs, words)
    if searchs == "perfect_match"
      @books = Book.where("title LIKE ?", "#{words}")
    elsif searchs == "partial_match"
      @books = Book.where("title LIKE ?", "%#{words}%")
    elsif searchs == "forward_match"
      @books = Book.where("title LIKE ?", "#{words}%")
    elsif searchs == "rear_match"
      @books = Book.where("title LIKE ?", "%#{words}")
    end
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	validates :rate, numericality: {
	  less_than_or_equal_to: 5, 
	  greater_than_or_equal_to: 1}, presence: true


end