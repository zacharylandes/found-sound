class Api::V1::BaseController < ApplicationController
  def check_vaild_request
    if invalid_request
      render json: invalid_request_response
    end
  end

  def invalid_request
    return true if params['type'].nil?
    return true if params['q'].nil?
    return true if ApiKeyService.new(params['api_key']).invalid?
  end

  def invalid_request_response
    {results: "invalid request"}
  end
end
