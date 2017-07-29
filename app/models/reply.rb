class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  validates :content, presence: true
  has_many :upvoters, dependent: :destroy
  has_many :downvoters, dependent: :destroy
def upvote_reply user_id
    Upvoter.where(reply_id: id, user_id: user_id).length > 0
  end
  def classStringReply user_id
    if upvote_reply user_id
      return "upvoted"
    else
      return "notupvoted"
    end
  end


  def downvote_Reply user_id
    Downvoter.where(reply_id: id, user_id: user_id).length > 0
  end
  def classStringReplyDownvote user_id
    if downvote_Reply user_id
      return "downvoted"
    else
      return "notdownvoted"
    end
  end
end