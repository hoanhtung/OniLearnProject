class API::ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @user = ::User.find_by_id(params[:user_id])
    @exams = Exam.includes(:exam_details).where(user_id: @user.id).newest.page(params[:page]).per(5).joins(:course)
  end

  def info_of_exams
    @user = ::User.find_by_authentication_token(params[:authentication_token])
    if @user
      @exams = Exam.where(user_id: @user.id)
      total_mark_of_exam = @exams.sum(:total_mark)
      render json: { name_user: @user.name, amount_of_exams: @exams.all.size, total_mark: total_mark_of_exam, status: :ok }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def new
    @exam = Exam.new
  end

  def edit
  end

  def create
    @user = ::User.find_by_authentication_token(params[:authentication_token])
    params[:user_id] = @user.id
    @exam = @user.exams.build(exam_params)
    params[:exam_id] = @exam.id
    params[:exam_details].each do |item|
      params[:exam_id] = @exam.id
      params[:question_id] = item[:question_id]
      params[:mark_question] = item[:mark_question]
      params[:user_is_right] = item[:user_is_right]
      @exam_detail = @exam.exam_details.build(exam_details_params)
      if params[:answer_details]
        item[:answer_details].each do |answer_item|
          params[:exam_detail_id] = @exam_detail.id
          params[:answer_id_user] = answer_item[:answer_id_user]
          @answer_detail = @exam_detail.answer_details.build(answer_details_params)
        end
      end
    end
    if @exam.save 
      # format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
      render json: { info: @exam.to_json(:include => :exam_details), status: :created }
    else
      format.html { render :new }
      render json: { info: @exam.errors, status: :unprocessable_entity }        
    end
  end

  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def exam_params
      params.fetch(:exam, {})
    end
    def exam_params
      params.require(:exam).permit(:total_mark, :course_id, :user_id)
    end
    def exam_details_params
      params.permit(:exam_id, :question_id, :mark_question, :user_is_right)
    end
    def answer_details_params
      params.permit(:exam_detail_id, :answer_id_user)
    end
end
