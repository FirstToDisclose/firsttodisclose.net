class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :innovations
  has_many :collections
  has_many :reviews
  has_many :revisions

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      user = find_or_create_user(auth)
    end
    # Associate the identity with the user in case needed
    identity.update!(user: user)
    user
  end

  def self.find_or_create_user(auth)
    find_user_by_email(auth).nil? ? create_user_from_oauth(auth) : find_user_by_email(auth)
  end

  def self.find_user_by_email(auth)
    email = auth.info.email
    user = User.where(:email => email).first if email
  end

  def self.create_user_from_oauth(auth)
    user = User.new(
      name: auth.extra.raw_info.name,
      email: auth.info.email,
      password: Devise.friendly_token[0,20]
    )
    user.save!
    user
  end

  def reviewer?
    self.reviewer
  end

  def admin?
    self.admin
  end

end
