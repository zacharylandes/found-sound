class Admin::AnalyticsController < Admin::BaseController
  def index
    @analytics = AdminAnalyticsPresenter.new
  end
end
