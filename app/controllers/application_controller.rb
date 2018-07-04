class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # before_action :authenticate_admin!
    # before_action :skip_session
    skip_before_action :verify_authenticity_token
    include Authenticable
    def after_sign_in_path_for(resource_or_scope)
        home_path
    end

    def after_sign_up_path_for(resource)
        after_sign_in_path_for(resource)
    end

    def after_sign_out_path_for(resource_or_scope)
        new_admin_session_path #tam
      end
end
