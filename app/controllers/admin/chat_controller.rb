class Admin::ChatController < Admin::BaseController
  def index
    @chatrooms = Chatroom.all.order("created_at DESC")
  end

  def show
    @chatroom = Chatroom.find(params[:id])
  end

  def create
    current_user.chat_messages.new(chat_message_params)
  end

  private
    def chat_message_params
      params.require(:message).permit(:chatroom_id, :body)
    end
end
