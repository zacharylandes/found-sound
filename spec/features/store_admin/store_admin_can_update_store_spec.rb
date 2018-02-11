require 'rails_helper'

describe "As a store admin " do
  context "I visit store edit page" do
    before(:each) do
      @store_admin= create(:user)
      @store = create(:store)
      create(:user_store, user: @store_admin, store: @store, user_type: 1)
      create_list(:item, 3, store: @store)
    end

    it "I can update store info" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@store_admin)
      visit dashboard_index_path

      click_on "My Stores"
      click_on "Manage Store"
      expect(current_path).to eq ("/#{@store.slug}/manage")

      fill_in "name", :with => "A Great Store"
      fill_in "address", :with => "A Great Store"

      click_on "Submit"



    end

    it "can authenticate with twitter" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@store_admin)
      stub_twitter_omniauth
      visit dashboard_index_path

      click_on "My Stores"
      click_on "Manage Store"
      expect(current_path).to eq ("/#{@store.slug}/manage")

      expect(@store.twitter_token).to be_nil
      expect(@store.twitter_secret).to be_nil

      click_on "Add Twitter Authorization"

      updated_store = Store.find(@store.id)

      expect(updated_store.twitter_token).to_not be_nil
      expect(updated_store.twitter_secret).to_not be_nil
    end

    it "can unauthenticate with twitter" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@store_admin)
      stub_twitter_omniauth
      visit dashboard_index_path

      click_on "My Stores"
      click_on "Manage Store"
      expect(current_path).to eq ("/#{@store.slug}/manage")

      expect(@store.twitter_token).to be_nil
      expect(@store.twitter_secret).to be_nil

      click_on "Add Twitter Authorization"

      updated_store = Store.find(@store.id)

      expect(updated_store.twitter_token).to_not be_nil
      expect(updated_store.twitter_secret).to_not be_nil

      click_on "Remove Twitter Authorization"

      updated_store = Store.find(@store.id)

      expect(updated_store.twitter_token).to be_nil
      expect(updated_store.twitter_secret).to be_nil
    end
  end
end
