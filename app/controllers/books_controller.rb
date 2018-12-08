class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
	end

	def show
		@books = Book.new
		@book = Book.find(params[:id])
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
	  if  @book.save
	  	  flash[:create] = 'Book was successfully created.'
	  	  redirect_to book_path(@book)
	  else
		  @books = Book.all   # 同じコントローラ内でもう1度空のフォームを用意しなければいけないので、indexアクションに取りに行く。しかし、render をすると、行った先の記述が無くなる。
		                      # → indexにある記述を用意する。（@bookはcreateで用意したので大丈夫。ただ、@booksはcreateにないので、renderの前に用意して持っていってもらう。）
	      render :index       # エラーメッセージは books/index.html.erb へ
	  end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.user_id = current_user.id
  	  if  @book.update(book_params)
  		  flash[:update] = 'Book was successfully updated.'
  		  redirect_to book_path(@book)
	  else
    	  render action: :edit
	  end
	end

	def destroy
		book = Book.find(params[:id])
  	  if  book.destroy
  	      flash[:destroy] = 'Book was successfully destroyed.'
  	      redirect_to books_path
  	  else
  		  render action: :new
  	  end
  	end

	private
	def book_params
		params.require(:book).permit(:title, :opinion)
	end
end
