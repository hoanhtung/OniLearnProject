class API::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @course = Course.find(params[:course_id])
    @questions = Question.includes(:answers).where(course_id: @course.id)
    respond_to do |format|
      format.html
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @question.answers.all }
    end
  end

  # GET /questions/new
  def new
    @course = Course.find(params[:course_id])
    @question = Question.new
    @question.answers.build
  end

  # GET /questions/1/edit
  def edit
    @action = 'edit'
    # @answers = Answer.where(question_id: @question.id)
  end

  # POST /questions
  # POST /questions.json
  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update_attributes(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :course_id, answers_attributes: [:id, :content, :is_right])
    end
end
