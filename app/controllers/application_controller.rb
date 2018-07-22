class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception


    # acts_as_token_authentication_handler_for User
    # before_action :authenticate_admin!
    
    # skip_before_action :verify_authenticity_token
    def after_sign_in_path_for(resource_or_scope)
        home_path
    end

    def after_sign_up_path_for(resource)
        after_sign_in_path_for(resource)
    end

    def after_sign_out_path_for(resource_or_scope)
        root_path #tam
    end
end
