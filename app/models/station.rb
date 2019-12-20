class Station
  attr_reader :name, :address, :city, :state, :zip, :fuel_type, :access_times

  def initialize(attrs)
    @name = attrs[:station_name]
    @address = attrs[:street_address]
    @city = attrs[:city]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @fuel_type = attrs[:fuel_type_code]
    @access_times = attrs[:access_days_time]
  end
end
