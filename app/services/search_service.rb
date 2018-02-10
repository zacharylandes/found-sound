class SearchService
  include ActiveModel::Serialization

  attr_reader :type,
              :query,
              :api_key,
              :q

  def initialize(search_params)
    @type = search_params['type']
    @q = search_params['q']
    @query = search_params['q'].singularize if search_params['q']
    @api_key = ApiKeyService.new(search_params['api_key'])
  end

  def results
    if type == 'items'
      search_items
    end
  end

  private
    def search_items
      Item.where(condition: "active")
          .where("items.title LIKE ? OR items.description LIKE ?", "%#{query}%", "%#{query}%")
    end
end
