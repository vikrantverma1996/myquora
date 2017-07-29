class Upvotea < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  validates :user, presence: true
  validates :answer, presence: true
  validates_uniqueness_of :user, :scope => :answer
end
