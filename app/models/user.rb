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

  # Static methods:
  def self.find_by_email(email)
    if email.nil?
      return nil
    end
    self.where(:email => email).first_or_create(self.new_user_params)
  end

  def self.new_user_params
    temp_password = (0...8).map { (65 + rand(26)).chr }.join
    { :password => temp_password, :password_confirmation => temp_password }
  end
end
