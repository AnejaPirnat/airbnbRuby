class CitiesController < ApplicationController
    def index
      cities = City.where(country_id: params[:country_id])
      render json: cities
    end
end