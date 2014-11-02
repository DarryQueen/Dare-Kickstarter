class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :funds, :through => :user
  validates :points, presence: true
end
