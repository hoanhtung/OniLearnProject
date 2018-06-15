Rails.application.routes.draw do
  root to: "welcome#home"
  # devise_for :users, :controllers => {
  #   :omniauth_callbacks => "user/omniauth_callbacks"
  # }

  resources :exams
  resources :answer_details
  resources :exam_details
  # resources :users
  resources :answers
  resources :questions
  resources :courses
  resources :subjects
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
