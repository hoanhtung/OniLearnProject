class API::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  def create
    @user = ::User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      render json: @user.as_json(only: [:authentication_token]), status: :created
    else
      render json: {info: "Invalid Email or Password", status: :unauthorized}
    end
  end

  def destroy
      admin = ::User.find_by(authentication_token: params[:id])
      admin.generate_authentication_token!
      admin.save
      head 204
  end
end
