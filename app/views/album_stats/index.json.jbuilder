json.array!(@album_stats) do |album_stat|
  json.extract! album_stat, :id
  json.url album_stat_url(album_stat, format: :json)
end
