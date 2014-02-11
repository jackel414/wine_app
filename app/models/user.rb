class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  
  has_many :wine, dependent: :destroy
  
  validates_presence_of :password, :email, :first_name, :last_name, :username, :on => :create
  validates_confirmation_of :password
  validates_uniqueness_of :email, :username
  
  def self.authenticate(username, password)
    user = find_by_username(username)
	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	  user
	else
	  nil
	end
  end
  
  def encrypt_password
	if password.present?
	  self.password_salt = BCrypt::Engine.generate_salt
	  self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end
  end
end
