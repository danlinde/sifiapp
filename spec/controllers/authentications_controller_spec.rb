require 'spec_helper'

describe AuthenticationsController do
	it 'redirects to email on new twitter user' do
		request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
		get :twitter
		expect(response).to redirect_to new_organizer_registration_path
	end

	it 'signs in a user with existing twitter'

	context "adding stripe to twitter" do
		it 'creates a new a new authenication'
		it "can still sign in with twitter"
	end
end
