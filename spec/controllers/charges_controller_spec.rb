require 'spec_helper'

describe ChargesController do
	let(:participant){create(:participant)}
	before do
		session[:participant_token] = participant.token
	end

	it "updates participant status to paid" do
		event = create(:event)
		post :create, event_id: event, participant: participant

		expect(Participant.find_by_token(participant.token)).to be_valid
		expect(assigns[:participant].paid).to eq true
	end

	it "renders event page after charge made" do
		event = create(:event)
		post :create, event_id: event
		expect(response.status).to eq 200
	end
end
