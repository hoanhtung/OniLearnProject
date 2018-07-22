class API::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]

  def load_multichoice_questions
    @questions = Question.load_multichoice
    render json: @questions
  end
  def load_true_false_questions
    @questions = Question.load_true_false
    render json: @questions
  end
  def load_random_questions
    @questions = Question.load_by_course(params[:course_id]).load_random(params[:amount])
    render json: @questions
  end
  def load_random_multichoice_questions
    @questions = Question.load_by_course(params[:course_id]).load_multichoice.load_random(params[:amount])
    render json: @questions.to_json(:include => :answers)
  end
  def load_random_true_false_questions
    @questions = Question.load_by_course(params[:course_id]).load_true_false.load_random(params[:amount])
    render json: @questions.to_json(:include => :answers)
  end

  # GET /questions
  # GET /questions.json
  def index
    @course = Course.find(params[:course_id])
    @subject = Subject.find_by_id(@course.subject_id)
    @questions = Question.includes(:answers).where(course_id: @course.id)
    respond_to do |format|
      format.html
      format.json { render json: @questions.to_json(:include => :answers) }
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
    @action = 'new'
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
    @question.answers.delete_all
    # @answers = @question.answers.find(params[:question][:answers_attributes])
    respond_to do |format|
      if @question.update_attributes(question_params) 
        # && @question.answers.find()update_attributes(answer_params)
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
      params.require(:question).permit(:content, :type_question, :course_id, answers_attributes: [:id, :content, :is_right])
    end
    def answer_params
      params.require(:answer).permit(:content, :is_right)
    end
    def question_update_params
      params.require(:question).permit(:content)
    end
end
