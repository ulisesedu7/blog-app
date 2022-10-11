require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before :each do
    @user = User.create(
      name: 'Ulises',
      photo: 'https://www.pexels.com/photo/green-pine-trees-near-body-of-water-1064162/',
      bio: 'I enjoy music and watching movies',
      posts_counter: 0
    )

    @post = Post.create(author: @user, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'Title 2', text: 'Text 2', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'Title 3', text: 'Text 3', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'Title 4', text: 'Text 4', comments_counter: 0, likes_counter: 0)

    visit "/users/#{@user.id}/posts"
  end

  it 'Displays the information of the user' do
    expect(page).to have_content(@user.name)
    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.posts_counter.to_s)
  end

  it 'Displays the title of the post' do
    expect(page).to have_content(@post.title)
  end

  it 'Displays the text of the post' do
    expect(page).to have_content(@post.text)
  end

  it 'Displays the comments of the post' do
    comments = @post.comments
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'Displays the number of comments of the post' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'Displays the number of likes of the post' do
    expect(page).to have_content(@post.likes_counter)
  end

  it 'Redirects the user to the post show page' do
    click_link(@post.title)
    expect(current_path).to eq("/users/#{@user.id}/posts/#{@post.id}")
  end
end
