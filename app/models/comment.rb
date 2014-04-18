class Comment < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :body, :commenter, :email

  validates :email, presence: true, length: {minimum: 8}

  validates :commenter, presence: true, length: {minimum: 4}

#  before_create :create_user

  def check_user
    email = self.email
    password = Devise.friendly_token[0,8]
    flash[:success_alert] =  "A confirmation mail has been sent to your email.
                              Your default password is #{password}."
    User.create(email: email, password: password, password_confirmation: password)
  end

end