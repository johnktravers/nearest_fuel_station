class SearchFacade
  def initialize(location)
    @location = location
  end

  def nearest_station
    service = NRELService.new
    @station ||= Station.new(service.nearest_station(location))
  end

  def name
    nearest_station.name
  end

  def address
    nearest_station.address
  end

  def city
    nearest_station.city
  end

  def state
    nearest_station.state
  end

  def zip
    nearest_station.zip
  end

  def fuel_type
    nearest_station.fuel_type
  end

  def access_times
    nearest_station.access_times
  end


  private

  attr_reader :location
end
