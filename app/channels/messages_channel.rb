class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{params['room']}:messages"
  end

  def receive(message_data)
    ChatMessage.create(user: current_user, chatroom_id: params["room"], body: message_data["message"])
  end
end
