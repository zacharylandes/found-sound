class ApiKeyService
  attr_reader :api_key

  def initialize(api_key)
    @api_key = api_key
  end

  def invalid?
    return true if Developer.find_by(key: api_key).nil? && ENV['search_api_key'] != api_key
  end
end
