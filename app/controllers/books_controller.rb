class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:start, :about]

	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end


	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		if book.save
			flash[:notice] = "You have creatad book successfully."
      		redirect_to book_path(book.id)
    	else
    		flash[:notice] = "error"
      		redirect_to books_path
    	end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id == current_user.id

		else
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
      		redirect_to book_path(@book.id)
    	else
			puts @book.errors.full_messages
    		flash[:notice] = "error"
      		render "edit"
    	end
	end


	def about
	end

	def start
	end

	def destroy
		book = Book.find(params[:id])
		if book.destroy
  		flash[:notice] = "Book was successfully destroyed."
  		redirect_to books_path
  		end
	end

	private
	def book_params
	  params.require(:book).permit(:title, :body)
	end

end
