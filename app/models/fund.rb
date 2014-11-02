class Fund < ActiveRecord::Base
  belongs_to :dare
  belongs_to :user
  validates :points, presence: true
  validates :user, presence: true
  validates :dare, presence: true

end
