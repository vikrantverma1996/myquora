class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many :upvotecs, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :downvotecs, dependent: :destroy
  validates :content, presence: true
  validates :user, presence: true
def upvote_comment user_id
    Upvotec.where(comment_id: id, user_id: user_id).length > 0
  end
  def classStringComment user_id
    if upvote_comment user_id
      return "upvoted"
    else
      return "notupvoted"
    end
  end


  def downvote_comment user_id
    Downvotec.where(comment_id: id, user_id: user_id).length > 0
  end
  def classStringCommentDownvote user_id
    if downvote_comment user_id
      return "downvoted"
    else
      return "notdownvoted"
    end
  end
end
