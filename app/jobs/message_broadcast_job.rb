class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    payload = {message: message.body, user: message.user.first_name}
    ActionCable.server.broadcast "room-#{message.chatroom_id}:messages", message: payload.to_json
  end
end
