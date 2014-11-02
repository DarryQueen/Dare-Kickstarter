class Dare < ActiveRecord::Base
  has_many :funds, dependent: :destroy
  belongs_to :creator, :foreign_key => "creator_id", :class_name => "User"
  belongs_to :subject, :foreign_key => "subject_id", :class_name => "User"
  validates :description, length: { minimum: DareKickstarter::Application.config.min_description_length,
    message: "Description needs to be at least #{DareKickstarter::Application.config.min_description_length} characters." }
  validates :title, presence: {:message => "Title can't be blank." }
  validates :creator, presence: {:message => "Needs a creator." }

end
