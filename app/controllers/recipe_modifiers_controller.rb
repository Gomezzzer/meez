class RecipeModifiersController < ApplicationController
  before_action :set_recipe_modifier, only: %i[ show edit update destroy ]

  # GET /recipe_modifiers or /recipe_modifiers.json
  def index
    @recipe_modifiers = RecipeModifier.all
  end

  # GET /recipe_modifiers/1 or /recipe_modifiers/1.json
  def show
  #  @recipe_modifier = RecipeModifier.find(params[:id])
  end
  

  # GET /recipe_modifiers/new
  def new
    @recipe_modifier = RecipeModifier.new
  end

  # GET /recipe_modifiers/1/edit
  def edit
  end


  

  # POST /recipe_modifiers or /recipe_modifiers.json
  def create
    @recipe_modifier = RecipeModifier.new(recipe_modifier_params)

    respond_to do |format|
      if @recipe_modifier.save
        format.html { redirect_to recipe_modifier_url(@recipe_modifier), notice: "Recipe modifier was successfully created." }
        format.json { render :show, status: :created, location: @recipe_modifier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_modifiers/1 or /recipe_modifiers/1.json
  def update
    respond_to do |format|
      if @recipe_modifier.update(recipe_modifier_params)
        format.html { redirect_to recipe_modifier_url(@recipe_modifier), notice: "Recipe modifier was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_modifier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  


  # DELETE /recipe_modifiers/1 or /recipe_modifiers/1.json
  def destroy
    @recipe_modifier = RecipeModifier.find(params[:id])
    @recipe_modifier.destroy
    redirect_to recipe_modifiers_url, notice: "Recipe modifier was successfully destroyed."
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
   def set_recipe_modifier
     @recipe_modifier = RecipeModifier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_modifier_params
      params.require(:recipe_modifier).permit(:name, :description, :recipe, :measurements)
    end
end
