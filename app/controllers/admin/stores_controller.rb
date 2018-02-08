class Admin::StoresController < ApplicationController
before_action :require_admin
  def index
    @active_stores = Store.active_stores
  end

  def pending_stores
    @pending_stores = Store.pending_stores
    render :pending
  end

  def suspended_stores
    @suspended_stores = Store.suspended_stores
    render :suspended
  end

  def update
    Store.find(params[:id]).update(status:"active")
    redirect_to admin_stores_path
  end

private
  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
