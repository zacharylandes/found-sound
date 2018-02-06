class Admin::DashboardsController < Admin::BaseController
  def index
    @categories= Category.all
    @organization = Organization.new
    @needs = Organization.find_by(user_id: current_user.id).needs.all if Organization.find_by(user_id: current_user)
    @need = Organization.find_by(user_id: current_user.id).needs.new if Organization.find_by(user_id: current_user)
  end

end
