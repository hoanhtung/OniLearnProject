class API::CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]

  def find_all_by_sub_id
    @courses = Course.where(subject_id: params[:sub_id])
    respond_to do |format|
      format.json { render :json => {subjects: @courses}}
    end
  end

  def index
    @subject = Subject.find(params[:subject_id])
    @courses = Course.where(subject_id: @subject.id)
    respond_to do |format|
      format.html
      format.json { render json: @courses}
    end
  end

  def show
    # @course = Course.find(params[:id])
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @course = Course.new
  end

  def edit
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @course = @subject.courses.create(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to subject_courses_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to subject_courses_path(@course.subject.id), notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @course.destroy
  #   respond_to do |format|
  #     format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :type_course, :icon)
    end
end
