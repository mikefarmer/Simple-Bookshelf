class Book < ActiveRecord::Base
  has_many :chosen_books
  has_many :bookshelves, :through => :chosen_books
end
