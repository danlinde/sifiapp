class AuthenticationsController < ApplicationController

	skip_before_filter :nag_user_for_email

	def twitter
		auth_login do
			token = omni['credentials'].token
			token_secret = omni['credentials'].token_secret
			current_organizer.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
		end
	end

	def stripe_connect
		auth_login do |omni|
			token = omni['credentials'].token
			current_organizer.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :stripe_publishable_key => omni["info"]["stripe_publishable_key"])
		end
	end

	def failure
		flash[:error] = "Failure signing in"
		redirect_to new_event_path
	end

	def auth_login
		#raise omni = request.env["omniauth.auth"].to_yaml
		omni = request.env['omniauth.auth']
		authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

		if authentication
			# Sign in
			flash[:notice] = "Logged in Successfully"
			sign_in Organizer.find(authentication.organizer_id)
			redirect_to current_organizer
		elsif current_organizer
			# Add to existing account
			# current_organizer.authentications.create!(yield)
			yield(omni)
													# this is an example if we were to pull from 'raw info' instead
													# :stripe_publishable_key => omni["extra"]["raw_info"]["stripe_publishable_key"])
			flash[:notice] = 'Authentication successful.'
			# sign_in_and_redirect current_organizer
			redirect_to new_event_path

		else
			# Sign up
			organizer = Organizer.new
			organizer.apply_omniauth(omni)
			if organizer.save
				sign_in_and_redirect Organizer.find(organizer.id)
			else
				session[:omniauth] = omni.except('extra')
				redirect_to new_organizer_registration_path
			end
		end
	end

	def set_email
		current_organizer.email = params[:organizer][:email]
		current_organizer.save!
		redirect_to '/'
	end
	
end
