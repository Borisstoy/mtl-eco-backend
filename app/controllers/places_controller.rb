class PlacesController < ApplicationController
    before_action :set_places, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:index, :show]

    # GET /places
    def index
        @places = Place.all

        render json: @places
    end

    # GET /places/1
    def show
        render json: @place
    end

    # POST /places
    def create
        @place = Place.new(place_params)

        if @place.save
        render json: @place, status: :created, location: @place
        else
        render json: @place.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /places/1
    def update
        if @place.update(place_params)
        render json: @place
        else
        render json: @place.errors, status: :unprocessable_entity
        end
    end

    # DELETE /places/1
    def destroy
        @place.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_places
            @place = Place.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def places_params
            params.require(:places).permit(:name, :description, :address)
        end
    end
