class Dare < ActiveRecord::Base
  has_many :funds, dependent: :destroy
end
