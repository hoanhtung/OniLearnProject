class API::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def find_all_by_cate_id
    @subject = Subject.where(category_id: params[:cate_id])
    respond_to do |format|
      format.json { render :json => {subjects: @subject}}
    end
  end

  # GET /subjects
  # GET /subjects.json
  def index
    @category = Category.find(params[:category_id])
    @subjects = Subject.where(category_id: @category.id).page(params[:page]).per(5)
    respond_to do |format|
      format.html { render :index, locals: {category: @category}}
      format.json { render json: @subjects}
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
  end

  # GET /subjects/new
  def new
    @category = Category.find(params[:category_id])
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
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

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    # @category = Category.find(params[:category_id])
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to category_subjects_path(@subject.category_id), notice: 'Subject was successfully updated.' }
        format.json { render :index, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :image)
    end
end
