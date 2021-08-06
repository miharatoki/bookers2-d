class Tag < ApplicationRecord
  has_many :book_tags, foreign_key: 'tag_id', dependent: :destroy
  has_many :books, through: :book_tags 
end
