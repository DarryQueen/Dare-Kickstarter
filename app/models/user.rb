class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :wallet
  has_many :funds

  after_initialize :initialize_fields

  def initialize_fields
    self.wallet = Wallet.new(points: DareKickstarter::Application.config.starting_points)
  end
end
