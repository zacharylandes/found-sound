class Rate
  attr_reader :rate, :carrier, :delivery_time
  def initialize(rate)
    @carrier = rate[:carrier]
    @rate = rate[:rate]
    @delivery_time = rate[:est_delivery_days]
  end

end
