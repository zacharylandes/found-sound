describe "Logged in user visits a suspended store" do
  it "gets a 404 erroe" do
    # Background: There is an active company with a name of "Vandelay Industries" with 2 active items and 1 inactive item. There is also 1 item that isn't associated with this store.
    vandelay = create(:store, name: "vandelay industries", status: 'suspended')
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit "/vandelay-industries"

    expect{visit "/vandelay-industries" }.to raise_error(ActionController::RoutingError)

  end
end
