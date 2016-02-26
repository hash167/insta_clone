class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many	:comments, dependent: :destroy
  validates :user_name, presence: true, length: {minimum: 4}
  validates_length_of :user_name, maximum: 12
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
