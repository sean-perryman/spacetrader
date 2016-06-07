json.array!(@planets) do |planet|
  json.extract! planet, :id, :Name
  json.url planet_url(planet, format: :json)
end
