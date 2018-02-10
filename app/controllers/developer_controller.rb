class DeveloperController < ApplicationController
  def show
  end

  def create
    Developer.create(user: current_user)
    redirect_to developer_path
  end
end
