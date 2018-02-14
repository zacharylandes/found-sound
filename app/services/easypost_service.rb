class EasypostService

  def initialize
    # @conn = Faraday.new(url: "https://api.easypost.com/v2") do |faraday|
    #   faraday.headers['api_key'] = "1uwKz8JPf6DCiVH8ZQaiVg"
    #   faraday.adapter Faraday.default_adapter
    # end
  end

  def addresses
    response = Faraday.post("https://api.easypost.com/v2/shipments?shipment[to_address][name]=Dr. Steve Brule&shipment[to_address][street1]=179 N Harbor Dr&shipment[to_address][city]=Redondo Beach&shipment[to_address][state]=CA&shipment[to_address][zip]=90277&shipment[to_address][country]=US&shipment[to_address][phone]=8573875756&shipment[to_address][email]=dr_steve_brule@gmail.com&shipment[from_address][name]=EasyPost&shipment[from_address][street1]=417 Montgomery st&shipment[from_address][street2]=5th Floor&shipment[from_address][city]=San Francisco&shipment[from_address][state]=CA&shipment[from_address][zip]=94104&shipment[from_address][country]=US&shipment[from_address][phone]=4153334445&shipment[from_address][email]=support@easypost.com&shipment[parcel][length]=20.2&shipment[parcel][width]=10.9&shipment[parcel][height]=5&shipment[parcel][weight]=65.9&api_key=1uwKz8JPf6DCiVH8ZQaiVg")
    b = JSON.parse(response.body)
    binding.pry
  end

end
