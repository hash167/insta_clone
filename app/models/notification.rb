class Notification < ActiveRecord::Base
  	belongs_to :notified_by, class_name: 'User'  
	belongs_to :user  
	belongs_to :post
	validates :user_id, :notified_by_id, :post_id, :identifier, :notification_type, presence: true
end
