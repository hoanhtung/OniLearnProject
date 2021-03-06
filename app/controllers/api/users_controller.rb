class API::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update]
  # GET /users
  # GET /users.json
  def index
    @users = ::User.includes(:exams).all.newest.page(params[:page]).per(5)
    @flag = 'index_user'
    respond_to do |format|
      format.html 
      format.json { render json: @users, status: :ok}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = ::User.new(user_params)
    if @user.save
      render json: {info: "success", status: :created}
    else
      render json: {info: "fail", status: :unprocessable_entity}
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
