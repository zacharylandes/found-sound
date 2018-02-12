class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :visitor?, :has_store_role?, :at_this_store?, :not_found, :has_upper_permissions?, :suspended?
  before_action :set_cart, :set_departments, :set_categories, :authorize!

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def at_this_store?
      Store.find_by(slug: params[:store]).user_stores.where(user_id: current_user.id).exists?
  end

  def has_upper_permissions?
    return false if current_user.nil?
    return true if current_user.store_admin? || current_user.store_manager? || current_user.role == 1
  end

  def has_store_role?
    return false if current_user.nil?
    return true if (current_user.store_admin? && at_this_store?) || (current_user.store_manager? && at_this_store?) || current_user.role == 1
  end

  def visitor?
    return true if current_user.nil?
  end

  def set_cart
    @cart ||= CartDecorator.new(Cart.new(session[:cart]))
  end

  def set_departments
    @departments = Department.all
  end

  def set_categories
    @categories = Category.all
  end

  private


    def authorize!
      not_found unless current_permission.authorized?
    end

    def current_permission
      @current_permission ||= Permission.new(current_user, params[:controller], params[:action])
    end

    def require_admin
      not_found unless current_admin?
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
