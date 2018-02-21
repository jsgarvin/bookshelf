module Web::Controllers::Books
  class Create
    include Web::Action
    include Hanami::Action::Session

    expose :book

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @book = BookRepository.new.create(params[:book])
        flash[:info] = "Book created successfully."
        redirect_to routes.books_path
      else
        self.status = 422
      end
    end
  end
end
