describe "Logged in user visits an active store" do
  it "sees only items belonging to this store" do
    # Background: There is an active company with a name of "Vandelay Industries" with 2 active items and 1 inactive item. There is also 1 item that isn't associated with this store.
    vandelay = create(:store, name: "vandelay industries", status: 'active')
    item_1, item_2 = create_list(:item, 2, condition: 'active', store: vandelay)
    inactive_item = create(:item, condition: 'retired', store: vandelay)
    nike_town = create(:store, name: "nike town", status: "active")
    nike_item = create(:item, store: nike_town)
    # As a logged in user
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit "/vandelay-industries"
    visit "/vandelay-industries"
    # Then I should see a list of all active items for this store
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)
    # And I should not see inactive items or items for other stores
    expect(page).to_not have_content(inactive_item.title)
    expect(page).to_not have_content(nike_item.title)

    visit '/nike-town'

    expect(page).to_not have_content(item_1.title)
    expect(page).to_not have_content(item_2.title)

    expect(page).to have_content(nike_item.title)
  end
end
