require 'rails_helper'

RSpec.feature 'Creating Home Page' do
  scenario 'User visits home' do
    visit '/'
    expect(page).to have_link('Athlete\'s Den')
    expect(page).to have_link('Home')
    expect(page).to have_content('Workout Lounge')
  end
end