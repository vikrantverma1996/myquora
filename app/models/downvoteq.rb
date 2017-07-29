class Downvoteq < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :user, presence: true
  validates :question, presence: true
  validates_uniqueness_of :user, :scope => :question
end
