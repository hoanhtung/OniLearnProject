Rails.application.routes.draw do
  root to: "welcome#home"
  # namespace :api do
    devise_for :users, :controllers => {
      :omniauth_callbacks => "user/omniauth_callbacks"
    }

    get '/find_by_category_id', to: 'subjects#find_all_by_cate_id'
    get '/find_by_subject_id', to: 'courses#find_all_by_sub_id'
    resources :exams
    resources :answer_details
    resources :exam_details
  # resources :users
  
  resources :categories, only: [:index, :edit, :update, :new, :create] , shallow: true do
    resources :subjects, shallow: true do
      resources :courses, shallow: true do
        resources :questions do
          resources :answers
        end
      end
    end
  end
# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
