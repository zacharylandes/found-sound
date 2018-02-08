require 'rails_helper'
RSpec.describe "As a visitor can visit category show page" do
  it " can visit category show page" do
    cats = create(:category, title: "Cats")
    create_list(:item, 2, category: cats)

    visit '/categories/cats'
  end
end
