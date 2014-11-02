class Wallet < ActiveRecord::Base
	belongs_to :user
	has_many :funds, :through => :user
end
