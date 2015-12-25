json.array!(@albums) do |album|
  json.extract! album, :id, :user, :password, :album_name, :secured, :created_date
  json.url album_url(album, format: :json)
end
