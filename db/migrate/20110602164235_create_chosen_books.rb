class CreateChosenBooks < ActiveRecord::Migration
  def self.up
    create_table :chosen_books do |t|
      t.integer :bookshelf_id
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chosen_books
  end
end
