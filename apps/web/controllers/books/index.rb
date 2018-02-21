module Web::Controllers::Books
  class Index
    include Web::Action
    include Hanami::Action::Session

    expose :books, :message

    def call(params)
      @message = flash[:info]
      @books = BookRepository.new.all
    end
  end
end
