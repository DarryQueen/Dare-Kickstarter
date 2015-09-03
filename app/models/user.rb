class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :wallet
  has_many :funds

  after_initialize :initialize_fields

  TEMP_EMAIL_PREFIX = 'change@me'

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

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration.
      if user.nil?
        user = User.new(
          :email => email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          :password => Devise.friendly_token[0, 20],
          :name => auth.info.name
        )
        user.skip_confirmation! if user.respond_to?(:skip_confirmation)
        user.save!
      end
    end

    # Associate the identity with the user if needed:
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
end
