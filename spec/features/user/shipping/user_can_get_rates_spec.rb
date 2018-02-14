require 'rails_helper'


describe "when a user checks out an order" do
  context "they are taken to a new page to choose shipping rates" do
    it "should add the shipping amount to the order total" do
      VCR.use_cassette("easypost response") do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit cart_path
        click_on "Checkout"

      end
    end
  end
end
