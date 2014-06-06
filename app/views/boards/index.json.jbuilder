json.array!(@boards) do |board|
  json.extract! board, :id, :title, :intro, :user_id
  json.url board_url(board, format: :json)
end
