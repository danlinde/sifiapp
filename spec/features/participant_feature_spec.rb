require 'spec_helper'

describe 'Participant' do
	context "organizer not stripe connected" do
		let(:lunch) do
			create(:event, name: "Lunch today")
		end

		it 'should be able to decline invitation' do
			visit participant_token_path(lunch, "32characters")

			click_button "No"
			expect(page).to have_content "Your response has been updated"
		end

		it 'should not be able to accept invitation if organizer is not connected to Stripe' do
			visit participant_token_path(lunch, "32characters")

			click_button "Yes"
			expect(page).to have_content 'The event organizer must connect with Stripe'
		end
	end

	context "if organizer stripe connected" do
		it 'should be able to accept invitation' do
			lunch = create(:event_with_oauth)
			visit participant_token_path(lunch, "32characters")
			click_button "Yes"
			expect(page).to have_content "Please pay the amount set by your event organizer to finalize your RSVP"
		end
	end
end