class ExamDetailsController < ApplicationController
  before_action :set_exam_detail, only: [:show, :edit, :update, :destroy]

  # GET /exam_details
  # GET /exam_details.json
  def index
    @exam_details = ExamDetail.all
  end

  # GET /exam_details/1
  # GET /exam_details/1.json
  def show
  end

  # GET /exam_details/new
  def new
    @exam_detail = ExamDetail.new
  end

  # GET /exam_details/1/edit
  def edit
  end

  # POST /exam_details
  # POST /exam_details.json
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

  # PATCH/PUT /exam_details/1
  # PATCH/PUT /exam_details/1.json
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

  # DELETE /exam_details/1
  # DELETE /exam_details/1.json
  def destroy
    @exam_detail.destroy
    respond_to do |format|
      format.html { redirect_to exam_details_url, notice: 'Exam detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_detail
      @exam_detail = ExamDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_detail_params
      params.fetch(:exam_detail, {})
    end
end
