require 'form_helper'

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.includes(:ingredients, :comments).all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    # @recipe.ingredients.build
  end

  # GET /recipes/1/edit
  def edit
    logger.debug "attempting to edit. params: #{params}"
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def new_ingredient
    respond_to do |format|
      if params["newrow"] == "Y"
        @recipe = Recipe.new(recipe_params)
        @recipe.save
      else
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
      end

      if !@recipe.errors.any?
        2.times do
          @recipe.ingredients << Ingredient.new({ "recipe_id" => params[:id] });
        end
        format.html { redirect_to edit_recipe_path(@recipe.id) }
      else
        if params["newrow"] == "Y"
          format.html { render :new }
        else
          format.html { render :edit }
        end
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :directions, :rating, ingredients_attributes: [:id, :name, :amount, :uom])
    end
end
