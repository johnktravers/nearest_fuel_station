class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :access_times,
              :distance,
              :travel_time,
              :directions

  def initialize(location)
    attrs = station_data(location)
    @name = attrs[:station_name]
    @address = "#{attrs[:street_address]}, #{attrs[:city]}, #{attrs[:state]} #{attrs[:zip]}"
    @fuel_type = attrs[:fuel_type_code]
    @access_times = attrs[:access_days_time]

    directions_attrs = directions_data(location, @address)
    @distance = directions_attrs[:distance][:text]
    @travel_time = directions_attrs[:duration][:text]
    @directions = directions_attrs[:steps].map do |step|
      ActionView::Base.full_sanitizer.sanitize(step[:html_instructions])
    end
  end

  def station_data(location)
    service = NRELService.new
    @station_data ||= service.nearest_station(location)
  end

  def directions_data(origin, destination)
    service = GoogleMapsService.new
    @directions_data ||= service.directions(origin, destination)
  end
end
