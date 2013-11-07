require 'spec_helper'

describe "Twitter authentication" do
	it 'redirects to get email page' do
		organizer = create(:organizer_with_oauth)
		login_as(organizer, scope: :organizer)

		visit '/'
		expect(current_path).to eq authentications_get_email_path
	end

	it 'stops redirecting once we have provided an email' do
		organizer = create(:organizer_with_oauth)
		login_as(organizer, scope: :organizer)

		visit '/'
		fill_in 'Email', with: 'b@b.com'
		click_button 'Add email'

		visit '/events/new'
		expect(current_path).to eq '/events/new'
	end
end


describe "Stripe authentication" do
	it  "cannot enter amount without stripe connect auth" do
		organizer = create(:organizer)
		login_as(organizer, scope: :organizer)
		visit new_event_path
		expect(page).not_to have_content "amount"		
	end

	it "can sign in from button on new event page" do
		pending
	end

end
