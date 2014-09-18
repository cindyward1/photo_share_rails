require 'rails_helper'

describe "Add a New Line" do
  it "creates a new bus line" do
    visit '/bus_lines/new'
    fill_in 'Line name', :with => 'Line 1'
    click_button 'Create Bus line'
    expect(page).to have_content 'Bus line created'
  end

  it "will give an error if a duplicate name is used" do
    visit '/bus_lines/new'
    fill_in 'Line name', :with => 'Line 1'
    click_button 'Create Bus line'
    visit '/bus_lines/new'
    fill_in 'Line name', :with => 'Line 1'
    click_button 'Create Bus line'
    expect(page).to have_content 'Line name has already been taken'
  end
end

describe "Edit a Bus Line" do
  it "edits the name of an existing bus line" do
    visit '/bus_lines/new'
    fill_in 'Line name', :with => 'Line 1'
    click_button 'Create Bus line'
    click_link 'Line 1'
    click_link 'Line 1'
    fill_in 'Line name', :with => 'Line 1 updated'
    click_button 'Update Bus line'
    expect(page).to have_content 'Bus line updated'
  end

  it "will give an error if the new name is blank" do
    visit '/bus_lines/new'
    fill_in 'Line name', :with => 'Line 1'
    click_button 'Create Bus line'
    click_link 'Line 1'
    click_link 'Line 1'
    fill_in 'Line name', :with => ""
    click_button 'Update Bus line'
    expect(page).to have_content "Line name can't be blank"
  end

  it "will delete a bus line" do
    visit '/bus_lines/new'
    fill_in 'Line name', :with => 'Line 1'
    click_button 'Create Bus line'
    click_link 'Line 1'
    click_link 'Line 1'
    click_link 'Delete Bus line'
    expect(page).to have_content "Bus line deleted"
  end
end
