module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:token_digest] = user.token_digest
	end

	def current_user
		if (user_id = session[:user_id])
			@current_user = User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(cookies[:token_digest])
				log_in user
				@current_user = user
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:token_digest)
	end

end
