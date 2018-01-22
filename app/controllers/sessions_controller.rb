class SessionsController < ApplicationController
  def new
    render layout: 'login'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.user_type == 1
        redirect_to management_mng_book_path
      else
        redirect_to books_index_path
      end
    else
      flash[:danger] = 'ログインに失敗しました'
      redirect_to books_index_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to books_index_path
  end
end
