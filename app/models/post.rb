class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes

  after_save :update_post_counter

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, allow_nil: true },
                               comparison: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :likes_counter, numericality: { only_integer: true, allow_nil: true },
                            comparison: { greater_than_or_equal_to: 0, allow_nil: true }

  def recents_comments
    comments.order(created_at: :desc).includes([:author]).limit(5)
  end

  def update_post_counter
    user = User.find(author_id)
    user.increment(:posts_counter)
    user.save
  end
end
