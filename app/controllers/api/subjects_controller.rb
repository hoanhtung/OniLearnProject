class API::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]
  layout false, only: [:new, :edit, :new_subject]
  #---------------api------------
  def find_all_by_cate_id
    @subject = Subject.where(category_id: params[:category_id])
    respond_to do |format|
      format.json { render :json => {subjects: @subject}}
    end
  end
  def find_subject_by_id
    @subject = Subject.find_by_id(params[:subject_id])
    respond_to do |format|
      format.json { render :json => {cate_id: @subject.category_id}}
    end
  end    
  #lấy ngày cập nhật mới nhất
  def get_newest_updated_time
    @time = Subject.maximum("updated_at")
    render json: @time
  end

  def show_newest
    if params[:search_subject]
      all_subject = Subject.search_by_name(params[:search_subject])
      @subjects = all_subject.newest.page(params[:page]).per(5)
      if all_subject.all.size == 0
        flash[:result] = "Không tìm thấy kết quả phù hợp"
        flash[:noti_empty] = "empty"
      else
        flash[:result] = "Tìm thấy #{all_subject.all.size} kết quả phù hợp"
        flash[:noti_empty] = ""
      end
    else
      @subjects = Subject.all.newest.page(params[:page]).per(5).joins(:category)
      flash[:result] = ""
      flash[:noti_empty] = ""
    end
    @action = 'show_newest'
    @flag = 'index_subject'
    respond_to do |format|
      format.html { render :index}
      format.json { render json: @subjects.to_json(:include => :courses), status: :ok}
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @subjects = Subject.where(category_id: @category.id).newest.page(params[:page]).per(5)
    @flag = 'index_subject'
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

 # ca update theo category va khong theo category
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
