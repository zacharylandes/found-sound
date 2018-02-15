class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :chat_messages

  def unread_messages
    # Could lead to an awesome service
    "None"
  end
end
