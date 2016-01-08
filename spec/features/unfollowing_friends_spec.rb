require 'rails_helper'

RSpec.feature 'Unfollowing Friend' do
  before do
    @john = User.create(first_name: 'John', last_name: 'Dough', email: 'john@example.com', password: 'password')
    @lania = User.create(first_name: 'Lania', last_name: 'Sanchez', email: 'lania@example.com', password: 'password')

    login_as(@john)

    @following = Friendship.create(user: @john, friend: @lania)
  end

  scenario do
    visit '/'
    click_link 'My Lounge'
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@lania.full_name + ' unfollowed')
  end

end