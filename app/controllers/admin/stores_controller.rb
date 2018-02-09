class Admin::StoresController < ApplicationController
before_action :require_admin

  def index
    @stores = StatusPresenter.new(params['tab']).stores
    @tab= StatusPresenter.new(params['tab']).tab
  end

  def update
    Store.find(params[:id]).update(status:"active")
    redirect_to admin_stores_path(tab:"Active")
  end

private
  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
