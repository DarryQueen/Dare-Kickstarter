class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :funds, :through => :user
  validates :points, presence: { :message => "Points can't be blank." }
  validates :user, presence: { :message => "Must belong to user." }
  
end
