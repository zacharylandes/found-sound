describe "Logged in User sees a chat window" do
  it "it can see a message sent by that user" do
    user = create(:user)
    chatroom = create(:chatroom, user: user)
    create(:chat_message, body: "message 1", chatroom: chatroom, user: user)
    create(:chat_message, body: "I need help", chatroom: chatroom, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_css(".chat-tab")
    expect(page).to have_css("#messages")
    within '#messages' do
      expect(page).to have_content('message 1')
      expect(page).to have_content('I need help')
    end
  end

  it "sees responses from admin" do
    admin = create(:admin, first_name: "Frank")
    user = create(:user, first_name: "Max")
    chatroom = create(:chatroom, user: user)
    create(:chat_message, body: "message 1", chatroom: chatroom, user: user)
    create(:chat_message, body: "I need help", chatroom: chatroom, user: user)
    create(:chat_message, body: "How can I help?", chatroom: chatroom, user: admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_css(".chat-tab")
    expect(page).to have_css("#messages")
    within '#messages' do
      expect(page).to have_content('Max: message 1')
      expect(page).to have_content('Max: I need help')
      expect(page).to have_content("Frank: How can I help?")
    end
  end
end
