class ChatController < ApplicationController
  def show
    @chat_message = ChatMessage.new()
  end

  def create
    @chat_message = current_user.chat_messages.new(chat_message_params)
  end

  private
    def chat_message_params
      params.require(:message).permit(:chatroom_id, :body)
    end
end
