require 'rails_helper'

RSpec.feature 'Listing Members' do
  before do
    @john = User.create(first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password')
    @sarah = User.create(first_name: 'Sara', last_name: 'Joseph', email: 'sara@example.com', password: 'password')
  end

  scenario 'shows a list of registered members' do
    visit '/'
    expect(page).to have_content('List of Members')
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end