require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before :each do
    @user = User.create(
      name: 'Ulises',
      photo: 'https://www.pexels.com/photo/green-pine-trees-near-body-of-water-1064162/',
      bio: 'I enjoy music and watching movies',
      posts_counter: 0
    )

    Post.create(author: @user, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'Title 2', text: 'Text 2', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'Title 3', text: 'Text 3', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'Title 4', text: 'Text 4', comments_counter: 0, likes_counter: 0)

    visit "/users/#{@user.id}"
  end

  it 'Displays the information of the user' do
    expect(page).to have_content(@user.name)
    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.posts_counter)
    expect(page).to have_content(@user.bio)
  end

  it 'Displays the first three posts of the user' do
    recent_posts = @user.recent_posts
    recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  it 'does contain a button that shows all posts' do
    expect(page).to have_content('See all posts')
  end

  it 'redirects the user to the complete list of posts' do
    click_link('See all posts')
    expect(current_path).to eq("/users/#{@user.id}/posts")
  end
end
