class BooksController < ApplicationController

      def index
        @books = Book.all
      end

      def show
        find_book
      end

      def find_book
        @book = Book.find(params[:id])
      end

      def new
        @book = Book.new
        render :new
      end

      def create
        @books = Book.all
        @new = Book.new(book_params[:book])
        @new.save

        render :index
      end

      def edit
        find_book
        render :edit
      end

      def update
        find_book
        params = book_params[:book]
        @book.update(params)
        @book.save
        redirect_to book_path
      end


      def destroy
        find_book
        @book.destroy
        redirect_to books_path
      end

      def upvote
        find_book
        @book.increment!(:vote)
        redirect_to books_path
      end

      def downvote
        find_book
        @book.decrement!(:vote)
        redirect_to books_path
      end

    private
      def book_params
        params.permit(book: [:title, :author, :description, :vote])
      end


end
