require 'rails_helper'

describe "Add a New Stop" do
  it "creates a new bus stop" do
    line = BusLine.create(:line_name => "Line 1")
    station = BusStation.create(:station_name => "Station 1")
    visit '/bus_stops/new'
    fill_in 'Stop time', :with => '7:00 am'
    select 'Station 1', :from => "bus_stop[bus_station_id]"
    select 'Line 1', :from => "bus_stop[bus_line_id]"
    click_button 'Create Bus stop'
    expect(page).to have_content 'Bus stop created'
  end
end
