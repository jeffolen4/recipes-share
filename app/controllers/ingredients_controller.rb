class IngredientsController < ApplicationController
  before_filter :set_recipe
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = @recipe.ingredients
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
    if params["recipe_id"] != nil
      @ingredient.recipe_id = params["recipe_id"].to_i
    end
    return @ingredient
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    recipe_id = @ingredient.recipe.id
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to edit_recipe_path( recipe_id ), notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ingredient_params
    params[:ingredient]
  end
end
