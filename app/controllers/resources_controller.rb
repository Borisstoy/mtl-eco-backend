class ResourcesController < ApplicationController
    skip_before_action :authenticate_request, only: [:places_kinds]

    # make it a cron job or cache the response
    def places_kinds
        render json: Place.places_kinds
    end
end