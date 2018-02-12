require 'rails_helper'
RSpec.describe "As a visitor can visit category show page" do
  it " can visit category show page" do
    department = create(:department, title: "books")
    cats = create(:category, title: "Cats", department: department)
    create_list(:item, 2, category: cats)

    visit departments_department_path(department.slug)
  end
end
