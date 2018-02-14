class EasypostService

  def initialize
    @conn = Faraday.new(url: "https://api.easypost.com/v2") do |faraday|
      faraday.headers['api_key'] = "1uwKz8JPf6DCiVH8ZQaiVg"
      faraday.adapter     Faraday.default_adapter
    end
  end

  def addresses
    response = @conn.get("/addresses")
    b = JSON.parse(response.body)
    binding.pry
  end

end
