class AuthenticationsController < ApplicationController

	skip_before_filter :nag_user_for_email

	def twitter
		auth_login
	end

	def stripe_connect
		auth_login
	end

	def auth_login
		#raise omni = request.env["omniauth.auth"].to_yaml

		omni = request.env['omniauth.auth']
		authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

		if authentication
			flash[:notice] = "Logged in Successfully"
			sign_in_and_redirect Organizer.find(authentication.organizer_id)

		# elsif current_organizer
		# 	raise "Login found"
		# 	token = omni['credentials'].token
		# 	token_secret = omni['credentials'].token_secret

		# 	current_organizer.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], 
		# 											:token => token, :token_secret => token_secret)
		# 	flash[:notice] = 'Authentication successful.'
		# 	sign_in_and_redirect current_organizer

		else
			organizer = Organizer.new
			organizer.apply_omniauth(omni)
			if organizer.save
				flash[:notice] = 'Logged in.'
				sign_in_and_redirect Organizer.find(organizer.id)
			else
				session[:omniauth] = omni.except('extra')
				redirect_to new_organizer_registration_path
			end
		end
	end

	def set_email
		current_organizer.email = params[:organizer][:email]
		current_organizer.save
		redirect_to '/'
	end

	
	
end
