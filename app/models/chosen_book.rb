class ChosenBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :bookshelf
end
