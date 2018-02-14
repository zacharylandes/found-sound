class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def recieve(message_data)
    message = ChatMessage.create(chatroom_id: message_data["chatroom_id"], body: message_data["message"])
    ActionCable.server.broadcast("messages", {message: message.body, chatroom_id: message.chatroom_id})
  end
end
