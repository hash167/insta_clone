class Post < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	validates :image, presence: true
	validates :user_id, presence: true
	has_attached_file :image, styles: { :medium => "640x" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	scope :of_followed_users, -> (following_users) { where user_id: following_users }
end
