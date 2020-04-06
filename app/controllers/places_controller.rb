class PlacesController < ApplicationController
    before_action :set_places, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:index, :show, :search]

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

    # Search places by attribute
    def search
        if params[:kind]
            places = params[:kind].split(',').map { |param| Place.search_by_kind(param) }.flatten
            if places.present?
                render json: places
            else
                render json: @places
            end
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_places
            @place = Place.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def place_params
            params.require(:place).permit(:name, :description, :address)
        end

        def search_params
            @search_params = params[:kind]
        end
    end