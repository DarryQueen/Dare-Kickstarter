class Fund < ActiveRecord::Base
  belongs_to :dare
  belongs_to :user
  validates :points, presence: { :message => "Points can't be blank." }
  validates :user, presence: { :message => "Must belong to user." }
  validates :dare, presence: { :message => "Must be associated with dare." }

end
