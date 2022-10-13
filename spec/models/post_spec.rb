require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(
    name: 'Edna',
    photo: 'picture.something',
    bio: 'Most beautiful',
    posts_counter: 3
  )

  subject do
    Post.create(
      author: user,
      title: 'Awesome things',
      comments_counter: 2,
      likes_counter: 3
    )
  end

  before { subject.save }

  it 'Title must not be empty' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not be longer than 250 chars' do
    expect(subject).to be_valid
  end

  it 'The comments_counter method must be an integer greater then or equal to zero' do
    expect(subject.comments_counter).to be_an_integer
    expect(subject.comments_counter).to be >= 0
  end

  it 'The likes_counter method must be an integer greater then or equal to zero' do
    expect(subject.likes_counter).to be_an_integer
    expect(subject.likes_counter).to be >= 0
  end

  it 'The subject should be an instance of the class Post' do
    expect(subject).to be_instance_of Post
  end

  it 'The subject should have the recent_comments method available' do
    expect(subject).to respond_to(:recent_comments)
  end

  it 'The subject should have the update_comments_counter method available' do
    expect(subject).to respond_to(:update_comments_counter)
  end

  it 'The subject should have the update_likes_counter method available' do
    expect(subject).to respond_to(:update_likes_counter)
  end
end
