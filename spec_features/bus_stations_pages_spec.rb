require 'rails_helper'

describe "Add a New Station" do
  it "creates a new bus station" do
    visit '/bus_stations/new'
    fill_in 'Station name', :with => 'Station 1'
    click_button 'Create Bus station'
    expect(page).to have_content 'Bus station created'
  end

  it "will give an error if a duplicate name is used" do
    visit '/bus_stations/new'
    fill_in 'Station name', :with => 'Station 1'
    click_button 'Create Bus station'
    visit '/bus_stations/new'
    fill_in 'Station name', :with => 'Station 1'
    click_button 'Create Bus station'
    expect(page).to have_content 'Station name has already been taken'
  end
end

describe "Edit a Bus Station" do
  it "edits the name of an existing bus station" do
    visit '/bus_stations/new'
    fill_in 'Station name', :with => 'Station 1'
    click_button 'Create Bus station'
    click_link 'Station 1'
    click_link 'Station 1'
    fill_in 'Station name', :with => 'Station 1a'
    click_button 'Update Bus station'
    expect(page).to have_content 'Bus station updated'
  end

  it "will give an error if the new name is blank" do
    visit '/bus_stations/new'
    fill_in 'Station name', :with => 'Station 1'
    click_button 'Create Bus station'
    click_link 'Station 1'
    click_link 'Station 1'
    fill_in 'Station name', :with => ''
    click_button 'Update Bus station'
    expect(page).to have_content "Station name can't be blank"
  end

  it "will delete a bus station" do
    visit '/bus_stations/new'
    fill_in 'Station name', :with => 'Station 1'
    click_button 'Create Bus station'
    click_link 'Station 1'
    click_link 'Station 1'
    click_link 'Delete Bus station'
    expect(page).to have_content "Bus station deleted"
  end
end
