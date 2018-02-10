require 'rails_helper'

describe "As a user with an API key" do
  describe "when I send a get request to the search api endpoint" do
    it "returns a json response with items with matching name and description" do
      item_1 = create(
        :item,
        title: "Nature's Diapers",
        description: "No chemicals or dyes. Also, they don't really work.",
        price: "30.00")

      item_2 = create(
        :item,
        title: "Dopo Tesigns Shoulder Bag",
        description: "Versitile bag great for commuting. Even makes as an excellent diaper bag. #dadcore #momcore",
        price: "125.00")

      user = create(:user)
      developer = create(:developer, user: user)
      search_type = "items"
      search_string = "diapers"

      get "/api/v1/search?type=#{search_type}&q=#{search_string}&api_key=#{developer.key}"

      search_response = JSON.parse(response.body)

      expected_item_search_response = {
        "type"=> "items",
        "q"=> "diapers",
        "results"=> [
            {"id"=> item_1.id,"title"=> "Nature's Diapers",
              "description"=> "No chemicals or dyes. Also, they don't really work.",
              "price"=> "$30.00"
            },
            {
              "id"=> item_2.id,
              "title"=> "Dopo Tesigns Shoulder Bag",
              "description"=> "Versitile bag great for commuting. Even makes as an excellent diaper bag. #dadcore #momcore",
              "price"=> "$125.00"
            }
          ]
        }

      expect(search_response).to eq(expected_item_search_response)
    end

    it "returns invalid request when a bad api key is sent" do
      search_type = "items"
      search_string = "diapers"

      get "/api/v1/search?type=#{search_type}&q=#{search_string}&api_key=invalid"

      search_response = JSON.parse(response.body)

      expect(search_response['results']).to eq('invalid request')
    end

    it "returns invalid request when a type is not sent" do
      user = create(:user)
      developer = create(:developer, user: user)

      search_string = "diapers"

      get "/api/v1/search?q=#{search_string}&api_key=#{developer.key}"

      search_response = JSON.parse(response.body)

      expect(search_response['results']).to eq('invalid request')
    end

    it "returns invalid request when a query is not sent" do
      user = create(:user)
      developer = create(:developer, user: user)

      search_type = "items"

      get "/api/v1/search?type=#{search_type}&api_key=#{developer.key}"

      search_response = JSON.parse(response.body)

      expect(search_response['results']).to eq('invalid request')
    end
  end
end
