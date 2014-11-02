class Fund < ActiveRecord::Base
  belongs_to :dare
  belongs_to :user
end
