require 'test_helper'

class BookshelfTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Bookshelf.new.valid?
  end
end
