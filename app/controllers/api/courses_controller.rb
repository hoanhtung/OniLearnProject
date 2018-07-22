class API::CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]
  layout false, only: [:new, :edit, :new_course]
  def find_all_by_sub_id
    @courses = Course.where(subject_id: params[:sub_id])
    respond_to do |format|
      format.json { render :json => {subjects: @courses}}
    end
  end

  def index
    @subject = Subject.find(params[:subject_id])
    @courses = Course.where(subject_id: @subject.id).newest.page(params[:page]).per(5).joins(:subject)
    @flag = 'index_course'
    respond_to do |format|
      format.html
      format.json { render json: @courses}
    end
  end

  def show_newest
    if params[:search_course]
      all_courses = Course.search_by_name(params[:search_course])
      @courses = all_courses.newest.page(params[:page]).per(5)
      if all_courses.all.size == 0
        flash[:result] = "Không tìm thấy kết quả phù hợp"
        flash[:noti_empty] = "empty"
      else
        flash[:result] = "Tìm thấy #{all_courses.all.size} kết quả phù hợp"
        flash[:noti_empty] = ""
      end
    else
      @courses = Course.all.newest.page(params[:page]).per(5).joins(:subject)
      flash[:result] = ""
      flash[:noti_empty] = ""
    end
    @action = 'show_newest'
    @flag = 'index_course'
    respond_to do |format|
      format.html { render :index}
      format.json { render json: @courses}
    end
  end

  def show
  end

  def new
    @subject = Subject.joins(:category).find(params[:subject_id])
    @course = Course.new
    @action = 'new'
  end

  def new_course
    @course = Course.new
    @action = 'new_course'
    render :new
  end

  def edit
    @action = 'edit'
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
  # for creating fast course
  def create_course
    @course = Course.create(fast_course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        format.json { render courses_path, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def update
    respond_to do |format|
      if @course.update(fast_course_params)
        format.html { redirect_to subject_courses_path(@course.subject_id), notice: 'Course was successfully updated.' }
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
    def fast_course_params
      params.require(:course).permit(:name, :description, :type_course, :icon, :subject_id)
    end
end
