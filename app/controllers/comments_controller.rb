class CommentsController < ApplicationController
  before_filter :set_recipe
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  # GET /comments
  # GET /comments.json
  def index
    @comments = @recipe.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = @recipe.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    logger.debug "comment add params: #{params}"
    @comment = @recipe.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@recipe], notice: 'Comment was successfully created.' }
        format.json { render [@recipe], status: :created, location: [@recipe] }
      else
        #format.html { render :new }
        format.html { render :template => 'recipes/show', :id => @recipe.id }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@recipe, @comment], notice: 'Comment was successfully updated.' }
        format.json { render [@recipe, @comment], status: :ok, location: [@recipe, @comment] }
      else
        #format.html { render :edit }
        format.html { render :controller => "recipes", :action => "show", :id => @recipe.id }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit( :id, :comment, :rating, :recipe_id )
    end
end
