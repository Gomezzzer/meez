class MeezEnPlacesController < ApplicationController
  before_action :set_meez_en_place, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /meez_en_places or /meez_en_places.json
  def index
   @pagy, @meez_en_places = pagy(MeezEnPlace.all)
  end

  # GET /meez_en_places/1 or /meez_en_places/1.json
  def show
  end

  # GET /meez_en_places/new
  def new
    @meez_en_place = MeezEnPlace.new
  end

  # GET /meez_en_places/1/edit
  def edit
  end

  # POST /meez_en_places or /meez_en_places.json
  def create
    @meez_en_place = MeezEnPlace.new(meez_en_place_params)
    @meez_en_place = current_user.meez_en_places.build(meez_en_place_params)

    respond_to do |format|
      if @meez_en_place.save
        format.html { redirect_to meez_en_place_url(@meez_en_place), notice: "Meez en place was successfully created." }
        format.json { render :show, status: :created, location: @meez_en_place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meez_en_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meez_en_places/1 or /meez_en_places/1.json
  def update
    respond_to do |format|
      if @meez_en_place.update(meez_en_place_params)
        format.html { redirect_to meez_en_place_url(@meez_en_place), notice: "Meez en place was successfully updated." }
        format.json { render :show, status: :ok, location: @meez_en_place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meez_en_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meez_en_places/1 or /meez_en_places/1.json
  def destroy
    @meez_en_place.destroy

    respond_to do |format|
      format.html { redirect_to meez_en_places_url, notice: "Meez en place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meez_en_place
      @meez_en_place = MeezEnPlace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meez_en_place_params
      params.require(:meez_en_place).permit(:ingredient_name, :measurement)
    end
end
