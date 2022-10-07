class User < ApplicationRecord
  # Data Relationships
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # Data Validation
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_posts
    Post.where(author: self).order(updated_at: :desc).first(3)
  end
end
