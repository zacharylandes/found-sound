require 'rails_helper'

describe "Home page Suggestions" do
  context "When a registered user visits the homepage" do
    it "should show a personalized list of suggestions based on items viewed" do
      killacam = create(:user, first_name: "Killa", last_name: "cam")
      item1,item2,item3,item4,item5,item6 = create_list(:item, 6)
      view1 = create(:view, user: killacam, item: item3)
      view2 = create(:view, user: killacam, item: item4)
      view3 = create(:view, user: killacam, item: item1)
      view4 = create(:view, user: killacam, item: item6)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(killacam)
      visit item_path(item3)
      visit item_path(item4)
      visit item_path(item1)
      visit item_path(item6)
      visit root_path

      expect(page).to have_content(item1.title)
      expect(page).to have_content(item4.title)
      expect(page).to have_content(item6.title)
      expect(page).to have_content(item1.title)

      expect(page).to have_no_content(item2.title)
      expect(page).to have_no_content(item5.title)
    end
  end
end
