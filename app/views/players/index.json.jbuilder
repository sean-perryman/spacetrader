json.array!(@players) do |player|
  json.extract! player, :id, :name, :credits
  json.url player_url(player, format: :json)
end
