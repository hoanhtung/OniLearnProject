Rails.application.routes.draw do
  root to: "welcome#home"
  devise_for :users, :controllers => {
    :omniauth_callbacks => "user/omniauth_callbacks"
  }

  get '/find_by_category_id', to: 'subjects#find_all_by_cate_id'
  get '/find_by_subject_id', to: 'courses#find_all_by_sub_id'
  resources :exams
  resources :answer_details
  resources :exam_details
  resources :questions
  # resources :users
  resources :categories do
    resources :subjects do
      resources :courses
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
