class Admin::StoresController < Admin::BaseController
  def index
    @stores = StatusPresenter.new(params['tab']).stores
    @tab= StatusPresenter.new(params['tab']).tab
  end

  def update
    Store.find(params[:id]).update(status:"active")
    redirect_to admin_stores_path(tab:"Active")
  end
end
