class BooksController < ApplicationController
  def index
    @booktalks = Book.all
  end

  def order
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      books = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )


      # 本のタイトル,画像URL,
      @books = []
      @isbn = []
      books.items.each do |item|
        book = BookOrder.new(
          item.get('ItemAttributes/Title'),
          item.get('ItemAttributes/Author'),
          item.get('ItemAttributes/ISBN'),
          item.get('ItemAttributes/PublicationDate'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL')
          )

        @books << book
        @isbn << item.get('ItemAttributes/ISBN')
      end
      @ordercount = BookOrder.where(isbn_code: @isbn)
    end
  end

  def create
    @book = BookOrder.new(bookorder_params)
    if @book.save
      redirect_to books_index_path
    else
      render 'new'
    end
  end

  def update
    @book = BookOrder.update(bookorder_update_params)
    if @book.save
      redirect_to books_index_path
    else
      render 'new'
    end
  end

#練習用メソッド
  def search
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      books = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )




      # 本のタイトル,画像URL,
      @books = []
      @isbn = []
      books.items.each do |item|
        book = BookOrder.new(
          item.get('ItemAttributes/Title'),
          item.get('ItemAttributes/Author'),
          item.get('ItemAttributes/ISBN'),
          item.get('ItemAttributes/PublicationDate'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL')
          )



        @books << book
        @isbn << item.get('ItemAttributes/ISBN')
      end
      BookOrder.where(isbn_code: @isbn)
    end
  end

  private
  def bookorder_params
    params.require(:book_orders).permit(
      :title,
      :author,
      :isbn_code,
      :publicationdate,
      :image_url,
      :url
    )
  end

  def bookorder_update_params
    params.require(:book_orders).permit(
      :isbn_code,
    )
  end

end
