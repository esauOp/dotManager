json.array!(@categories) do |category|
  json.extract! category, :name, :active
  json.url category_url(category, format: :json)
end