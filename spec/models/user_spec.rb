require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(
      name: 'Edna',
      photo: 'picture.something',
      bio: 'Most beautiful',
      posts_counter: 3
    )
  end

  before { subject.save }

  it 'Name must not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'The posts_counter method must be an integer greater then or equal to zero' do
    expect(subject.posts_counter).to be_an_integer
    expect(subject.posts_counter).to be >= 0
  end

  it 'The subject should be an instance of the class User' do
    expect(subject).to be_instance_of User
  end

  it 'The subject should have the recent_posts method available' do
    expect(subject).to respond_to(:recent_posts)
  end
end
