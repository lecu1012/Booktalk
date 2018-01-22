class ManagementController < ApplicationController
  #管理者ページ（トップ）
  def index
  end

  #管理者ページ（本登録）
  def mng_book
    #登録している本一覧を取得
    @booktalks = Book.all

    #本の検索情報の取得
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
        book = BookSearch.new(
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

  def book_create
    @book = Book.new(book_create_param)

    if @book.save
      redirect_to management_mng_book_path
    else
      render 'msg_book'
    end
  end

  def mng_user
    #ユーザの検索情報の取得
    if params[:keyword].present?
      @users = User.where("name LIKE?", "%#{params[:keyword]}%")
    end
  end

  def user_edit
    @user = User.find(params[:id])

    if params[:type].nil?
      if @user.update_attribute(:user_type, 1)
        redirect_to management_mng_user_path
      else
        render 'mng_user'
      end
    else
      if @user.update_attribute(:user_type, nil)
        redirect_to management_mng_user_path
      else
        render 'mng_user'
      end
    end

  end

  private
  def book_create_param
    params.permit(:title,:author,:isbn_code,:release,:image_url,:url)
  end

end
