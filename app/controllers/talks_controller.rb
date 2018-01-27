class TalksController < ApplicationController
  def index
    @book = Book.find_by(id: params[:book_id])
    @talk = Talk.new
    @talks = Talk.where(book_id: params[:book_id])
  end

  def create
    @talk = Talk.new(talk_param)
    if @talk.save
      redirect_to :controller => 'talks', :action => 'index', :book_id => @talk.book_id
    else
      @book = Book.find_by(id: @talk.book_id)
      @talks = Talk.where(book_id: @talk.book_id)
      render 'index'
    end
  end

  private
  def talk_param
    params.require(:talk).permit(:book_id ,:user_id ,:highlight ,:message)
  end
end
