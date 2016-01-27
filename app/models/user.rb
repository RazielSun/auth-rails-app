class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[a-z0-9_\-@\.]*\z/i

	before_save { self.email = email.downcase }
	
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
end
