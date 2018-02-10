require 'rails_helper'

describe "Home page Suggestions" do
  context "When a registered user visits the homepage" do
    it "should show a personalized lsit of suggestions based on items viewed" do
      killacam = create(:user, first_name: "Killa", last_name: "cam")
      viewed_items = []
      item1,item2,item3,item4,item5,item6 = create_list(:item, 6)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(killacam)
      # binding.pry
      visit item_path(item3)
      viewed_items << item3
      visit item_path(item4)
      viewed_items << item4
      visit item_path(item1)
      viewed_items << item1
      visit item_path(item6)
      viewed_items << item6
      visit root_path

      expect(page).to have_content(item1.title)
      expect(page).to have_content(item4.title)
      expect(page).to have_content(item6.title)
      expect(page).to have_content(item1.title)

      expect(page).to have_no_content(item2.title)
      expect(page).to have_no_content(item2.description)
      expect(page).to have_no_content(item5.title)
      expect(page).to have_no_content(item5.description)
    end
  end
end
