json.array!(@items) do |item|
  json.extract! item, :id, :Name, :Base_Price
  json.url item_url(item, format: :json)
end
