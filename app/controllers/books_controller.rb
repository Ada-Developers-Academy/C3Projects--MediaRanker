class BooksController < ApplicationController

      def index
        @books = Book.all
      end

      def show
        @book = Book.find(params[:id])
      end

      def new
        @book = Book.new
        render :new
      end

      def create
        @books = Book.all
        @new = Book.new(create_params[:book])
        @new.save

        render :index
      end

      def edit
        @book = Book.find(params[:id])
        render :edit
      end

      def update
        @book = Book.find(params[:id])
        album_params = create_params[:book]
        @book.update(album_params)
        @book.save
        redirect_to "/books/#{@book.id}"
      end


      def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to "/books"
      end

      def upvote
        @book = Book.find(params[:id])
        @book.increment!(:vote)
        redirect_to "/books"
      end

      def downvote
        @book = Book.find(params[:id])
        @book.decrement!(:vote)
        redirect_to "/books"
      end

    private
      def create_params
        params.permit(book: [:title, :author, :description, :vote])
      end


end
