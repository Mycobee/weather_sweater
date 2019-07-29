class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather, :today_details, :daily_forecasts, :hourly_forecasts
end
