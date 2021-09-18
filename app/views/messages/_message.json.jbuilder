json.extract! message, :id, :body, :sender_id, :receiver_id, :created_at, :updated_at
json.url message_url(message, format: :json)
