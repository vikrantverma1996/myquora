class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :firstName,presence: true
    validates :lastName,presence: true
	has_many :questions, dependent: :destroy
	has_many :answers,   dependent: :destroy
	has_many :replies,   dependent: :destroy
	has_many :upvoteqs,  dependent: :destroy
	has_many :upvoteas,  dependent: :destroy
	has_many :upvotecs,  dependent: :destroy
	has_many :upvoters,  dependent: :destroy
	has_many :comments,  dependent: :destroy
	has_many :downvoteqs,dependent: :destroy
	has_many :downvoteas,dependent: :destroy
	has_many :downvotecs,dependent: :destroy
	has_many :downvoters,dependent: :destroy
	has_many :comments,  dependent: :destroy
  	has_many :replies,   dependent: :destroy
	def followings
		User.find(FollowMapping.where(follower_id: id).pluck(:followee_id))
	end
	def followers
		User.find(FollowMapping.where(followee_id: id).pluck(:follower_id))
	end
	def followed followee_id,follower_id
		
		f = FollowMapping.where(follower_id: follower_id,followee_id: followee_id).first
		if f
			return "unfollow"
		else
			return "follow"
		end
	end
	enum post: {reader: 0, member: 1, moderator: 2, admin: 3}     
end
