require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before :each do
    user1 = User.create(
      name: 'Ulises',
      photo: 'https://www.pexels.com/photo/green-pine-trees-near-body-of-water-1064162/',
      bio: 'I enjoy music and watching movies',
      posts_counter: 0
    )
    user2 = User.create(
      name: 'Eduardo',
      photo: 'https://www.pexels.com/photo/green-pine-trees-near-body-of-water-1064162/',
      bio: "I'm enjoy reading books and hiking",
      posts_counter: 0
    )
    @users = [user1, user2]

    visit '/users'
  end

  it 'Displays the information of the user' do
    @users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src*='#{user.photo}']")
      expect(page).to have_content(user.posts_counter)
    end
  end

  it 'changes to user profile after clicking on a card' do
    click_link(@users.first.name.to_s)
    expect(page).to have_content('enjoy')
  end
end
