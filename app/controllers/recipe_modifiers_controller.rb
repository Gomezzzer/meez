class RecipeModifiersController < ApplicationController
  before_action :set_recipe_modifier, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /recipe_modifiers or /recipe_modifiers.json
  def index
    @q = current_user.recipe_modifiers.ransack(params[:q])
    @pagy, @recipe_modifiers = pagy(@q.result(distinct: true))
    @original_yields = calculate_original_yields(@recipe_modifiers)
  end

  # GET /recipe_modifiers/1 or /recipe_modifiers/1.json
  def show
    # @recipe_modifier is already set by the before_action
  end

  # GET /recipe_modifiers/new
  def new
    @recipe_modifier = current_user.recipe_modifiers.build
  end

  # GET /recipe_modifiers/1/edit
  def edit
    # @recipe_modifier is already set by the before_action
  end

  # POST /recipe_modifiers or /recipe_modifiers.json
  def create
    @recipe_modifier = current_user.recipe_modifiers.build(recipe_modifier_params)

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
    # @recipe_modifier is already set by the before_action

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
    # @recipe_modifier is already set by the before_action
    @recipe_modifier.destroy
    redirect_to recipe_modifiers_url, notice: "Recipe modifier was successfully destroyed."
  end

  # GET /recipe_modifiers/desired_yield_page
  def desired_yield_page
    # Retrieve the scaling factor from the request parameters
    @scaling_factor = params[:scaleFactor].to_f

    # Find the recipe modifier by ID and ensure it belongs to the current user
    @recipe_modifier = current_user.recipe_modifiers.find_by(id: params[:recipe_modifier_id])

    # Check if both scaling factor and recipe modifier are present
    unless @recipe_modifier && @scaling_factor
      redirect_to root_path, alert: 'Invalid request'
      return
    end

    # Calculate scaled quantities for each ingredient
    @scaled_measurements = @recipe_modifier.measurements.split('/').map do |measurement|
      quantity_match = measurement.match(/(\d+(?:\.\d*)?)\s*([^\d]*)$/)
      if quantity_match
        quantity = quantity_match[1].to_f
        unit = quantity_match[2].strip

        # Scale the quantity based on the scaling factor
        scaled_quantity = (quantity * @scaling_factor).round(2)

        # Combine the scaled quantity and unit into a string
        "#{scaled_quantity} #{unit}"
      else
        measurement
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_modifier
    @recipe_modifier = current_user.recipe_modifiers.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "RecipeModifier not found."
    redirect_to recipe_modifiers_path
  end

  # Only allow a list of trusted parameters through.
  def recipe_modifier_params
    params.require(:recipe_modifier).permit(:remove_image, :image, :name, :description, :recipe, :measurements, allergies: []).tap do |whitelisted|
      whitelisted[:allergies] = params[:recipe_modifier][:allergies].join(",") if params[:recipe_modifier][:allergies]
    end
  end

  # Calculate original yield for each recipe modifier
  def calculate_original_yields(recipe_modifiers)
    original_yields = {}
    recipe_modifiers.each do |recipe_modifier|
      # Implement your logic to calculate original yield based on the provided measurements
      # For example, you can parse the measurements string to extract the original yield
      # Let's assume the measurements string contains "Original Yield: X servings"
      measurements = recipe_modifier.measurements
      original_yield_match = measurements.match(/Original Yield: (\d+)/)
      original_yield = original_yield_match[1].to_i if original_yield_match
      original_yields[recipe_modifier.id] = original_yield
    end
    original_yields
  end
end
