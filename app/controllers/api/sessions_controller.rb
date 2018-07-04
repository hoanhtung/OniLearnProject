class API::SessionsController < ApplicationController
  def create
      admin_password = params[:session][:password]
      admin_email = params[:session][:email]
      admin = admin_email.present? && Admin.find_by(email: admin_email)

      if admin.valid_password? user_password
          sign_in admin, store: false
          admin.generate_authentication_token!
          admin.save
          render json: admin, status: 200, location: [:api, admin]
      else
          render json: { errors: "Invalid email or password" }, status: 422
      end
  end
  def destroy
      admin = Admin.find_by(auth_token: params[:id])
      admin.generate_authentication_token!
      admin.save
      head 204
  end
end
