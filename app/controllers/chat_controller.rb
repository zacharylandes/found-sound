class ChatController < ApplicationController
  def create
    @chat_message = current_user.chat_messages.new(chat_message_params)
  end

  private
    def chat_message_params
      params.require(:message).permit(:chatroom_id, :body)
    end
end
