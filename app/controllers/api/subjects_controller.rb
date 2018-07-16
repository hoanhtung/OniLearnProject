class API::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]
  layout false, only: [:new, :edit, :new_subject]
  
  def find_all_by_cate_id
    @subject = Subject.where(category_id: params[:cate_id])
    respond_to do |format|
      format.json { render :json => {subjects: @subject}}
    end
  end
  def get_newest_updated_time
    @time = Subject.maximum("updated_at")
    render json: @time
  end

  def show_newest
    @subjects = Subject.all.newest.page(params[:page]).per(5).joins(:category)
    @action = 'show_newest'
    respond_to do |format|
      format.html { render :index}
      format.json { render json: @subjects}
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @subjects = Subject.where(category_id: @category.id).page(params[:page]).per(5)
    respond_to do |format|
      format.html { render :index, locals: {category: @category}}
      format.json { render json: @subjects}
    end
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id])
    @subject = Subject.new
    @action = 'new'
  end
  def new_subject
    @subject = Subject.new
    @action = 'new_subject'
    render :new
  end

  def edit
    @action = 'edit'
  end

  def create
    @category = Category.find(params[:category_id])
    @subject = @category.subjects.create(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to category_subjects_path, notice: 'Subject was successfully created.' }
        format.json { render category_subjects, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  def create_subject #ko co san category
    @subject = Subject.create(updated_subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: 'Subject was successfully created.' }
        format.json { render category_subjects, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @subject.update(updated_subject_params)
        format.html { redirect_to category_subjects_path(@subject.category_id), notice: 'Subject was successfully updated.' }
        format.json { render :index, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :image)
    end
    def updated_subject_params
      params.require(:subject).permit(:name, :image, :category_id)
    end
end
