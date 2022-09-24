class User < ApplicationRecord
  # Data Relationships
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # Data Validation
  validates :title, presence: true
  validates :post_counter, presence: true, numerically: { greater_than_or_equal_to: 0, only_integer: trye}

  def recent_posts
    Post.where(author: self).order(updated_at: :desc).first(3)
  end
end
