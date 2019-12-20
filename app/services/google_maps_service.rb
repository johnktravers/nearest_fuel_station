class GoogleMapsService
  def directions(origin, destination)
    response = conn.get('maps/api/directions/json') do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
    end

    JSON.parse(response.body, symbolize_names: true)[:routes].first[:legs].first
  end


  private

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com',
      params: {key: ENV['GOOGLE_MAPS_API_KEY']}
    )
  end
end
