Rails.application.routes.draw do
  
  devise_for :admins, :controllers => {
    :sessions => "admins/sessions"
  }
  # root to: "welcome#home"
  devise_scope :admins do
    root to: "admins/sessions#new"
  end

  scope module: 'api', path: 'api' do
    # devise_for :users , :controllers => {
    #   :omniauth_callbacks => "api/user/omniauth_callbacks",
    #   :sessions => "api/user/sessions",
    #   :registrations => "api/user/registrations"
    # }
    # devise_for :users

    get '/home', to: 'welcome#home'

    get '/find_by_category_id', to: 'subjects#find_all_by_cate_id'
    get '/find_by_subject_id', to: 'courses#find_all_by_sub_id'
    # resources :exams
    # resources :answer_details
    # resources :exam_details
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
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
