class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[a-z0-9_\-@\.]*\z/i

	before_save { self.email = email.downcase }
	validates :name, presence: true
	validates :email, presence: true

	has_secure_password
end
