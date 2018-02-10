class Api::V1::SearchController < Api::V1::BaseController
  before_action :check_vaild_request

  def index
    if params[:type] == 'items'
      render json: SearchService.new(params), serializer: ItemSearchSerializer
    else
      invalid_response
    end
  end
end
