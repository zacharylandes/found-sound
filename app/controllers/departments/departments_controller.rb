class Departments::DepartmentsController < ApplicationController
  def show
    @presenter = DepartmentPresenter.new(params[:department], params[:category])
  end

end
