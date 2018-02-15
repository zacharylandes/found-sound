class EasypostService

  attr_reader :response, :shipment

  def initialize(shipping_params, user)
    @response = Faraday.post("https://api.easypost.com/v2/shipments?shipment[to_address][name]=#{user.full_name}&shipment[to_address][street1]=#{shipping_params[:street]}&shipment[to_address][city]=#{shipping_params[:city]}&shipment[to_address][state]=#{shipping_params[:state]}&shipment[to_address][zip]=#{shipping_params[:zip]}&shipment[to_address][country]=US&shipment[to_address][phone]=#{shipping_params[:phone]}&shipment[to_address][email]=#{user.email}&shipment[from_address][name]=Found Sound&shipment[from_address][street1]=1331 17th st&shipment[from_address][city]=Denver&shipment[from_address][state]=CO&shipment[from_address][zip]=80219&shipment[from_address][country]=US&shipment[from_address][phone]=4153334445&shipment[from_address][email]=support@foundsound.com&shipment[parcel][length]=20.2&shipment[parcel][width]=10.9&shipment[parcel][height]=5&shipment[parcel][weight]=65.9&api_key=#{ENV['easypost_key']}")
    @shipment = JSON.parse(@response.body, symbolize_names: true)[:rates]
  end

  def rates
    @shipment.map do |rate|
      Rate.new(rate)
    end
  end

end
