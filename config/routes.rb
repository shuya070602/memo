Rails.application.routes.draw do
  #トップページ、アバウトページ
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: "homes_about"
  #ユーザー機能
  devise_for :users
  get 'users/confirm' => 'users#confirm', as: "users_confirm"
  resources :users

  #メモ機能
  resources :notes

  #ジャンル機能
  resources :genres

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
