json.array!(@ships) do |ship|
  json.extract! ship, :id, :Name, :Base_Cargo
  json.url ship_url(ship, format: :json)
end
