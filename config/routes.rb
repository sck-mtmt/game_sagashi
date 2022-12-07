Rails.application.routes.draw do
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to:"homes#top"
    resources :games, only: [:index,:new,:create,:show,:edit,:update]
    resources :users, only: [:index,:show,:edit,:update]
    resources :reviews, only: [:index,:show,:destroy]
  end
  namespace :public do
    resources :games,only: [:index,:show]
    post 'users/my_page' => 'users#create'
    get 'users/my_page' => 'users#show'
    get 'users/my_page/edit' => 'users#edit'
    patch 'users/my_page' => 'users#update'
    get 'users/unsubsscribe' => 'users#unsubsscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :reviews,only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
  devise_scope :user do
    # post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'public/guest_sign_in', to: 'public/sessions#new_guest'
  end
    root to:'public/homes#top'
end
