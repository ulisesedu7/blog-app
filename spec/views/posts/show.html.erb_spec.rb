require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
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

    visit "/users/#{@user.id}/posts/#{@post.id}"
  end

  describe 'The post show page' do
    it 'displays the title of the post' do
      expect(page).to have_content(@post.title)
    end

    it 'displays who wrote the post' do
      expect(page).to have_content(@user.name)
    end

    it 'displays how many comments there are on a post' do
      expect(page).to have_content(@post.comments.count)
    end

    it 'displays how many likes there are on a post' do
      expect(page).to have_content(@post.likes.count)
    end

    it 'displays the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'displays all comments and the author name' do
      comments = @post.comments
      comments.each do |comment|
        expect(page).to have_content(comment.author.name)
        expect(page).to have_content(comment.text)
      end
    end
  end
end
