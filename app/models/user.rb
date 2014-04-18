class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :type, :provider, :uid, :oauth_token,
                  :oauth_expires_at, :confirmed_at, :confirmation_token, :confirmation_sent_at

  # attr_accessible :title, :body
  before_create :check_name
 # before_create :check_permissions


  def check_permission
    @user = self.user
  end


  def check_name
    if self.name.nil?
      self.name = "User"
    end
  end

  def self.from_omniauth(auth)
    puts "auth is ------------- #{auth} \n\n"

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.new

      user.confirmation_token = nil
      user.skip_confirmation!
      user.skip_confirmation_notification!
      #  user.confirm!
      user.save
      puts "customer.saved? ----------- #{user}"

    end
  end
end
