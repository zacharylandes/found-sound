describe "Logged in Admin can click chat support in nav bar" do
  describe "and is redirected to chatroom index page" do
    it "sees the open chat rooms" do
      admin = create(:admin)

      user_1 = create(:user)
      chatroom_1 = create(:chatroom, user: user_1)
      create(:chat_message, body: "message 1", chatroom: chatroom_1, user: user_1, created_at: 14.hours.ago)
      create(:chat_message, body: "I need help", chatroom: chatroom_1, user: user_1, created_at: 13.hours.ago)

      user_2 = create(:user)
      chatroom_2 = create(:chatroom, user: user_2)
      create(:chat_message, body: "message 1", chatroom: chatroom_2, user: user_2, created_at: 14.days.ago)
      create(:chat_message, body: "I need help", chatroom: chatroom_2, user: user_2, created_at: 13.days.ago)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit root_path

      click_on "Chat Support"

      within ".chatroom-#{chatroom_1.id}" do
        expect(page).to have_content("Chatroom #{chatroom_1.id}")
        expect(page).to have_content("about 13 hours ago")
      end

      within ".chatroom-#{chatroom_2.id}" do
        expect(page).to have_content("Chatroom #{chatroom_2.id}")
        expect(page).to have_content("13 days ago")
      end
    end

    it "can visit an open chat room and see the messages" do
      admin = create(:admin, first_name: "Frank")

      user_1 = create(:user, first_name: "Max")
      chatroom_1 = create(:chatroom, user: user_1)
      create(:chat_message, body: "message 1", chatroom: chatroom_1, user: user_1, created_at: 14.hours.ago)
      create(:chat_message, body: "I need help", chatroom: chatroom_1, user: user_1, created_at: 13.hours.ago)
      create(:chat_message, body: "How can I help?", chatroom: chatroom_1, user: admin, created_at: 12.hours.ago)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit root_path

      click_on "Chat Support"

      click_on "Chatroom #{chatroom_1.id}"

      expect(page).to have_content("Max: message 1")
      expect(page).to have_content("Max: I need help")
      expect(page).to have_content("Frank: How can I help?")
    end

    it "can visit an open chat room and see the users 5 most recent orders" do
      admin = create(:admin, first_name: "Frank")

      user_1 = create(:user, first_name: "Max", last_name: "Payne")
      o_1 = create(:order, user: user_1)
      o_2 = create(:order, user: user_1)
      o_3 = create(:order, user: user_1)
      o_4 = create(:order, user: user_1)
      o_5 = create(:order, user: user_1)
      o_6 = create(:order, user: user_1)

      chatroom_1 = create(:chatroom, user: user_1)
      create(:chat_message, body: "message 1", chatroom: chatroom_1, user: user_1, created_at: 14.hours.ago)
      create(:chat_message, body: "I need help", chatroom: chatroom_1, user: user_1, created_at: 13.hours.ago)
      create(:chat_message, body: "How can I help?", chatroom: chatroom_1, user: admin, created_at: 12.hours.ago)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit root_path

      click_on "Chat Support"

      click_on "Chatroom #{chatroom_1.id}"
      expect(page).to have_content("Max Payne")
      expect(page).to have_content("Order Count: 6")
      expect(page).to have_link("Order #{o_6.id}")
      expect(page).to have_link("Order #{o_5.id}")
      expect(page).to have_link("Order #{o_4.id}")
      expect(page).to have_link("Order #{o_3.id}")
      expect(page).to have_link("Order #{o_2.id}")
      expect(page).to_not have_link("Order #{o_1.id}")
    end
  end
end
