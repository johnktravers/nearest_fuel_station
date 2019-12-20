require 'rails_helper'

RSpec.describe NRELService, type: :service do
  it 'nearest station' do
    service = NRELService.new

    response = service.nearest_station('1331 17th St LL100 Denver CO 80202')

    expect(response[:station_name]).to eq('Seventeenth Street Plaza')
    expect(response[:street_address]).to eq('1225 17th St.')
    expect(response[:city]).to eq('Denver')
    expect(response[:state]).to eq('CO')
    expect(response[:zip]).to eq('80202')
    expect(response[:fuel_type_code]).to eq('ELEC')
    expect(response[:access_days_time]).to eq('MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
  end
end
