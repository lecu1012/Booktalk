Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#一般ページ
  get 'books/index'

#管理者ページ
  #本登録
  get 'management/mng_book' , to: 'management#mng_book'
  post 'management/bookcreate' , to: 'management#book_create'

  #ユーザ管理
  get 'management/mng_user'
  post 'management/useredit' , to: 'management#user_edit'

#ログイン機能
  get 'sessions/new'

  root to: 'books#index'

  resources :sessions
  resources :users
  resources :talks, only: [:index, :create]
end
