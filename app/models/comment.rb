class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :content, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates_length_of :content, maximum: 140
end
