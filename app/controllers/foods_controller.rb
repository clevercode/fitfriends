class FoodsController < ApplicationController
  before_action :authorize, :set_recipe
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = @recipe.foods.all
  end

  def show
  end

  def new
    @food = @recipe.foods.new
  end

  def edit
  end

  def create
    @food = @recipe.foods.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @recipe, notice: 'Food was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @recipe, notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :no_content }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = @recipe.foods.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:food_name, :carbs, :fat, :protein, :amount, :servings, :recipe_id)
    end
end
