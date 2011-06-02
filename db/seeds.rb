# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

Bookshelf.create(:name => "My Books")

books = [
  "Eloquent Ruby",
  "Shaping Things",
  "The Photographer's Eye",
  "America: The Last Best Hope (Volume I)",
  "Snow Crash",
  "Anathem",
  "Cryptonomicon",
  "The Problem of Pain",
  "The Lion, the Witch and the Wardrobe",
  "Ender's Geme",
  "Speaker for the Dead",
  "Ender in Exile",
  "Harry Potter and the Sorcerer's Stone",
  "Rails AntiPatterns",
  "Rails 3 Way",
  "Design Patterns in Ruby"
]

books.each do |book|
  Book.create( {:name => book} )
end
