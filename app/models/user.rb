class User < ActiveRecord::Base

	attr_accessor :token

	VALID_EMAIL_REGEX = /\A[a-z0-9_\-@\.]*\z/i

	before_save { self.email = email.downcase }
	
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password

	def User.digest(str)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def User.remember
		self.token = User.new_token
		update_attribute(:token_digest, User.digest(self.token))
	end

	def User.authenticated?(token)
		return false if token_digest.nil?
		BCrypt::Password.new(token_digest).is_password?(token)
	end

	def User.forget
		update_attribute(:token_digest, nil)
	end

end
