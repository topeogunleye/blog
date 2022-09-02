class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def as_json(_options = {})
    { id: id, text: text, post_id: post_id }
  end
end
