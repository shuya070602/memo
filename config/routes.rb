Rails.application.routes.draw do
  #トップページ、アバウトページ表示
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: "homes_about"

  #ユーザー機能、退会確認ページ表示
  devise_for :users
  get 'users/confirm' => 'users#confirm', as: "users_confirm"
  resources :users, only: [:index, :show, :edit, :update]

  #メモ機能
  resources :notes, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  #ジャンル機能
  resources :genres, only: [:new, :create, :index, :edit, :update, :destroy]

  #グループ機能
  resources :groups, only: [:new, :create, :index, :edit, :update, :destroy]

  #グループノート機能
  resources :group_notes, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
