json.extract! game, :id, :user_id, :game_master_id, :created_at, :updated_at
json.url game_url(game, format: :json)
