class Api::V1::ForecastsController < ApplicationController
	def show
		forecast = ForecastGenerator.new(params).get_forecast
		render json: ForecastSerializer(forecast)
	end
end

