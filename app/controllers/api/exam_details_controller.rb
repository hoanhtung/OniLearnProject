class API::ExamDetailsController < ApplicationController
  before_action :set_exam_detail, only: [:show, :edit, :update, :destroy]

  def index
    @question_of_exams = Array.new
    @exam = Exam.find_by_id(params[:exam_id])
    @exam_details = ExamDetail.includes(:answer_details).where(exam_id: @exam.id).joins(:question)
    @exam_details.each do |exam_detail|
      question = Question.includes(:answers).find_by_id(exam_detail.question_id)
      element = {mark: exam_detail.mark_question, correct: exam_detail.user_is_right,  content: exam_detail.question.content, type: exam_detail.question.type_question, answers: question.answers.all}
      @question_of_exams.push(element)
    end
      
    # @questions = @exam_details.question
  end

  def show
  end

  def new
    @exam_detail = ExamDetail.new
  end

  def edit
  end

  def create
    @exam_detail = ExamDetail.new(exam_detail_params)

    respond_to do |format|
      if @exam_detail.save
        format.html { redirect_to @exam_detail, notice: 'Exam detail was successfully created.' }
        format.json { render :show, status: :created, location: @exam_detail }
      else
        format.html { render :new }
        format.json { render json: @exam_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @exam_detail.update(exam_detail_params)
        format.html { redirect_to @exam_detail, notice: 'Exam detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_detail }
      else
        format.html { render :edit }
        format.json { render json: @exam_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam_detail.destroy
    respond_to do |format|
      format.html { redirect_to exam_details_url, notice: 'Exam detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_exam_detail
      @exam_detail = ExamDetail.find(params[:id])
    end

    def exam_detail_params
      params.fetch(:exam_detail, {})
    end
end
