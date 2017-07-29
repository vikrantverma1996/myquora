class Downvoter < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply
  validates :user, presence: true
  validates :reply, presence: true
  validates_uniqueness_of :user, :scope => :reply
end
