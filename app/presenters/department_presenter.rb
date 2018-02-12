class DepartmentPresenter
  attr_reader :department,
              :category

  def initialize(department, category)
    @department = Department.find_by(slug: department)
    @category   = Category.find_by(slug: category)
  end

  def categories
    department.categories
  end

  def items
    if category.nil?
      department.items
    else
      category.items
    end
  end
end
