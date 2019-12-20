class NRELService
  def nearest_station(location)
    response = conn.get('api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['location'] = location
      req.params['fuel_type'] = 'ELEC'
    end

    station_data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].first
  end


  private

  def conn
    Faraday.new(
      url: 'https://developer.nrel.gov',
      params: {api_key: ENV['NREL_API_KEY']}
    )
  end
end
