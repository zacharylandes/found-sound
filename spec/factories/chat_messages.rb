FactoryBot.define do
  factory :chat_message do
    chatroom
    user
    body "MyText"
  end
end
