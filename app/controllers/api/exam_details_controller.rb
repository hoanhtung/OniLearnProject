class API::ExamDetailsController < ApplicationController
  before_action :set_exam_detail, only: [:show, :edit, :update, :destroy]

  def index
    @exam = Exam.find_by_id(params[:exam_id])
    @exam_details = ExamDetail.includes(:answer_details).where(exam_id: @exam.id).joins(:question)
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
