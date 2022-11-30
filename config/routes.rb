Rails.application.routes.draw do
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#devise_for :users, controllers: {
    #registrations: 'users/registrations',
    #passwords: 'users/passwords'
  #}
  #devise_scope :user do
    #post 'users/guest_sign_in', as: 'users/sessions#guest_sign_in'
  #end
  namespace :admin do
    root to:"homes#top"
    resources :games, only: [:index,:new,:create,:show,:edit,:update]
    resources :users, only: [:index,:show,:edit,:update]
    resources :reviews, only: [:show,:edit,:destroy]
  end
  namespace :public do
    resources :games,only: [:index,:show]
    get 'users/my_page' => 'users#show'
    get 'users/my_page/edit' => 'users#edit'
    patch 'users/my_page' => 'users#update'
    get 'users/unsubsscribe' => 'users#unsubsscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :reviews,only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
    root to:'public/homes#top'
end

