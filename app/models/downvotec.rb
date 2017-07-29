class Downvotec < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  validates :user, presence: true
  validates :comment, presence: true
  validates_uniqueness_of :user, :scope => :comment
end
