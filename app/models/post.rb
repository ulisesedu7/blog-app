class Post < ApplicationRecord
  # Data Relationships
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  # Data Validation
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_save :update_posts_counter

  def recent_comments
    Comment.where(post: self).order(updated_at: :desc).first(5)
  end

  
  def update_posts_counter
    author.increment!(:posts_counter)
  end

  private :update_posts_counter
end
