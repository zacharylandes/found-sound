require 'rails_helper'

describe "As a visitor can visit department show page" do
  let(:department) {create(:department, title: "books")}
  let(:magic) {create(:category, title: "Magic", department: department)}
  let(:sci_fi) {create(:category, title: "Sci-Fi", department: department)}
  let(:instruments) {create(:department, title: "instruments")}
  let(:guitars) {create(:category, title: "Guitars", department: department)}


  before(:each) do
    create(:item, title: "Dove", category: magic)
    create(:item, title: "Light Saber", category: sci_fi)
    create(:item, title: "Guitar", category: guitars)
  end

  it "has all items in that department" do
    visit departments_department_path(department.slug)

    within(".items") do
      expect(page).to have_content("Dove")
      expect(page).to have_content("Light Saber")
      expect(page).to_not have_content("Guitars")
    end
  end

  it "can filter by category" do
    visit departments_department_path(department.slug)

    click_on "Magic"

    within(".items") do
      expect(page).to have_content("Dove")
      expect(page).to_not have_content("Light Saber")
      expect(page).to_not have_content("Guitars")
    end
  end
end
