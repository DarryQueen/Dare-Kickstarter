class Dare < ActiveRecord::Base
  has_many :funds, dependent: :destroy
  belongs_to :creator, :foreign_key => "creator_id", :class_name => "User"
  belongs_to :subject, :foreign_key => "subject_id", :class_name => "User"
  validates :description, length: { minimum: DareKickstarter::Application.config.min_description_length }
  validates :title, presence: true
  validates :creator, presence: true

end
