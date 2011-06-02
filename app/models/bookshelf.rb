class Bookshelf < ActiveRecord::Base
  has_many :chosen_books
  has_many :books, :through => :chosen_books
end
