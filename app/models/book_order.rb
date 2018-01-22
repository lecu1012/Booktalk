class BookOrder < ApplicationRecord

  # プロパティの設定
  attr_accessor :title, :author, :isbn, :publicationdate, :image_url, :url

  def initialize(title, author, isbn, publicationdate, image_url, url)
    @title = title
    @author = author
    @isbn = isbn
    @publicationdate = publicationdate
    @image_url = image_url
    @url = url

  end
end
