class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:like_counter)
  end

  private :update_like_counter
end
