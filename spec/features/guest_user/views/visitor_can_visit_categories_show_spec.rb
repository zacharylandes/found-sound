require 'rails_helper'

describe "As a visitor can visit department show page" do
  it "can filter by category" do
    department = create(:department, title: "books")
    magic = create(:category, title: "Magic", department: department)
    sci_fi = create(:category, title: "Sci-Fi", department: department)
    create(:item, title: "Dove", category: magic)
    create(:item, title: "Light Saber", category: sci_fi)

    visit departments_department_path(department.slug)

    click_on "Magic"

    within(".items") do
      expect(page).to have_content("Dove")
      expect(page).to_not have_content("Light Saber")
    end


  end
end
