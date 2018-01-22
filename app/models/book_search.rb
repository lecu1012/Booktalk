class BookSearch < ApplicationRecord

  # プロパティの設定
  attr_accessor :title, :author, :isbn_code, :release, :image_url, :url

  def initialize(title, author, isbn_code, release, image_url, url)
    @title = title
    @author = author
    @isbn_code = isbn_code
    @release = release
    @image_url = image_url
    @url = url
  end
end
