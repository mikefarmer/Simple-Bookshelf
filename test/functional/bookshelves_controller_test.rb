require 'test_helper'

class BookshelvesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Bookshelf.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Bookshelf.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Bookshelf.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to bookshelf_url(assigns(:bookshelf))
  end

  def test_edit
    get :edit, :id => Bookshelf.first
    assert_template 'edit'
  end

  def test_update_invalid
    Bookshelf.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bookshelf.first
    assert_template 'edit'
  end

  def test_update_valid
    Bookshelf.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bookshelf.first
    assert_redirected_to bookshelf_url(assigns(:bookshelf))
  end

  def test_destroy
    bookshelf = Bookshelf.first
    delete :destroy, :id => bookshelf
    assert_redirected_to bookshelves_url
    assert !Bookshelf.exists?(bookshelf.id)
  end
end
