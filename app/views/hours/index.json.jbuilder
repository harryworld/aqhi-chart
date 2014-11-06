json.array!(@hours) do |hour|
  json.extract! hour, :id, :district_id, :timeTitle, :no2, :o3, :so2, :co, :pm10, :pm25
  json.url hour_url(hour, format: :json)
end
