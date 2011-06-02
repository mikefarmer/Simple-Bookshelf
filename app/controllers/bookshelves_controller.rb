class BookshelvesController < ApplicationController
  def index
    @bookshelves = Bookshelf.all
  end

  def show
    @bookshelf = Bookshelf.find(params[:id])
  end

  def new
    @books = Book.all
    @bookshelf = Bookshelf.new
  end

  def create
    @bookshelf = Bookshelf.new(params[:bookshelf])
    if @bookshelf.save
      sync_selected_books
      redirect_to @bookshelf, :notice => "Successfully created bookshelf."
    else
      @books = Book.all
      render :action => 'new'
    end
  end

  def edit
    @bookshelf = Bookshelf.includes(:books).find(params[:id])
    @books = Book.all
  end

  def update
    @bookshelf = Bookshelf.find(params[:id])
    if @bookshelf.update_attributes(params[:bookshelf])
      sync_selected_books
      redirect_to @bookshelf, :notice  => "Successfully updated bookshelf."
    else
      @books = Book.all
      render :action => 'edit'
    end
  end

  def destroy
    @bookshelf = Bookshelf.find(params[:id])
    @bookshelf.destroy
    redirect_to bookshelves_url, :notice => "Successfully destroyed bookshelf."
  end

  private 

  def sync_selected_books
    if params[:books]
      checked_books = Book.where(:id => params[:books].keys).all
      current_books = @bookshelf.books

      books_to_remove = current_books - checked_books
      books_to_add = checked_books - current_books

      ChosenBook.delete_all(:bookshelf_id => @bookshelf.id, :book_id => books_to_remove)
      @bookshelf.books << books_to_add
    else
      ChosenBook.delete_all(:bookshelf_id => @bookshelf.id)
    end
  end

end
