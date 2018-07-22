  class API::CategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update]
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update]
    layout false, only: [:new, :edit]

    def index
      if params[:search_category]
        all_categories = Category.search_by_name(params[:search_category])
        @categories = all_categories.newest.page(params[:page]).per(5)
        if all_categories.all.size == 0
          flash[:result] = "Không tìm thấy kết quả phù hợp"
          flash[:noti_empty] = "empty"
        else
          flash[:result] = "Tìm thấy #{all_categories.all.size} kết quả phù hợp"
          flash[:noti_empty] = ""
        end
      else
        #.newes
        @categories = Category.all.newest.page(params[:page]).per(5)
        flash[:result] = ""
        flash[:noti_empty] = ""
      end
      @flag = 'index_cate'
      respond_to do |format|
        format.html 
        format.json { render json: @categories.to_json(:include => :subjects), status: :ok}
      end
    end

    def load_categories_subjects
      @categories = Category.includes(:subjects).all
      respond_to do |format|
        format.html 
        format.json { render json: @categories.to_json(:include => :subjects)}
      end
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

    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
  end

