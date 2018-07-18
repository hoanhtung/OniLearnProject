  class API::CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update]
    layout false, only: [:new, :edit]

    def index
      @categories = Category.all.newest.page(params[:page]).per(5)
      respond_to do |format|
        format.html 
        format.json { render json: @categories.to_json(:include => :subjects)}
      end
    end

    def load_categories_subjects
      @categories = Category.includes(:subjects).all
      respond_to do |format|
        format.json { render :json => {categories: @categories}}
      end
    end

    def show
    end

    def new
      @category = Category.new
      @action = 'new'
    end

    def edit
      @category = Category.find(params[:id])
      @action = 'edit'
    end

    def create
      @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
          format.json { render @category, status: :ok, location: @category }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
  end

