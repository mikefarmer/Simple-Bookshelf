class CreateBookshelves < ActiveRecord::Migration
  def self.up
    create_table :bookshelves do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :bookshelves
  end
end
