class AnswerDetailsController < ApplicationController
  before_action :set_answer_detail, only: [:show, :edit, :update, :destroy]

  # GET /answer_details
  # GET /answer_details.json
  def index
    @answer_details = AnswerDetail.all
  end

  # GET /answer_details/1
  # GET /answer_details/1.json
  def show
  end

  # GET /answer_details/new
  def new
    @answer_detail = AnswerDetail.new
  end

  # GET /answer_details/1/edit
  def edit
  end

  # POST /answer_details
  # POST /answer_details.json
  def create
    @answer_detail = AnswerDetail.new(answer_detail_params)

    respond_to do |format|
      if @answer_detail.save
        format.html { redirect_to @answer_detail, notice: 'Answer detail was successfully created.' }
        format.json { render :show, status: :created, location: @answer_detail }
      else
        format.html { render :new }
        format.json { render json: @answer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_details/1
  # PATCH/PUT /answer_details/1.json
  def update
    respond_to do |format|
      if @answer_detail.update(answer_detail_params)
        format.html { redirect_to @answer_detail, notice: 'Answer detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_detail }
      else
        format.html { render :edit }
        format.json { render json: @answer_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_details/1
  # DELETE /answer_details/1.json
  def destroy
    @answer_detail.destroy
    respond_to do |format|
      format.html { redirect_to answer_details_url, notice: 'Answer detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_detail
      @answer_detail = AnswerDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_detail_params
      params.fetch(:answer_detail, {})
    end
end
