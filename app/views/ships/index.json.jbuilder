json.array!(@ships) do |ship|
  json.extract! ship, :id, :name, :base_cargo
  json.url ship_url(ship, format: :json)
end
