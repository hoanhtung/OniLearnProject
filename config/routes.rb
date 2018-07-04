Rails.application.routes.draw do

  scope module: 'api' do
    
    concern :paginatable do
      get '(page/:page)', action: :index, on: :collection, as: ''
    end

    get '/home', to: 'welcome#home'
    resources :users
    resources :categories, concerns: :paginatable, only: [:index, :edit, :update, :new, :create], shallow: true do
      resources :subjects, concerns: :paginatable, only: [:index, :edit, :update, :new, :create], shallow: true do
        resources :courses, shallow: true do
          resources :questions do
            resources :answers
          end
        end
      end
    end
  end
  
  scope module: 'api', path: 'api', defaults: {format: :json} do
    # devise_for :users , :controllers => {
    #   :omniauth_callbacks => "api/user/omniauth_callbacks",
    #   :sessions => "api/user/sessions",
    #   :registrations => "api/user/registrations"
    # }   
    # devise_scope :users do
    #   root to: 'api/user/sessions#new'
    # end
    get '/find_by_category_id', to: 'subjects#find_all_by_cate_id'
    get '/find_by_subject_id', to: 'courses#find_all_by_sub_id'
    # resources :exams
    # resources :answer_details
    # resources :exam_details
    # resources :users
    resources :users
    resources :categories, only: [:index, :show, :update, :create], shallow: true do
      resources :subjects, only: [:index, :show, :update, :create], shallow: true do
        resources :courses, only: [:index, :show, :update, :create], shallow: true do
          resources :questions do
            resources :answers
          end
        end
      end
    end
  end

  devise_for :admins, :controllers => {
    sessions: "admins/sessions"
  }
  authenticated :admins do
    root to: 'admins/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
