require 'rails_helper'

describe 'user can visit the welcome page' do
  it 'and see a dropdown menu' do
    visit root_path

    expect(page).to have_content('Nearest Fuel Station')
    expect(page).to have_content('Search For The Nearest Electric Charging Station')
    expect(page).to have_button('Find Nearest Station')
  end

  it 'can find the nearest electric charging station to a location' do
    visit root_path

    select 'Turing', from: :location
    click_button 'Find Nearest Station'

    expect(current_path).to eq(search_path)

    within '.search-results' do
      expect(first('#station-name').text).to_not be_empty
      expect(page).to have_css('#address')
      expect(page).to have_css('#fuel-type')
      expect(page).to have_css('#access-times')
      expect(page).to have_css('#distance')
      expect(page).to have_css('#travel-time')
      expect(page).to have_css('#directions')
    end
  end
end
