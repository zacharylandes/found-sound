require 'rails_helper'

RSpec.describe UserStore, type: :model do

  context "Relationships" do
    it "belongs to a store and user" do
      user_store = create(:user_store)
      expect(user_store).to respond_to(:user)
      expect(user_store).to respond_to(:store)
    end
  end
end
