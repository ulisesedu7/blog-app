class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_comment_counter

  def update_comment_counter
    post.increment!(:comment_counter)
  end

  private :update_comment_counter
end