require 'spec_helper'

describe ChargesController do
	xit "updates participant status to paid" do
		event = create(:event)
		post :create, event_id: event, participant: attributes_for(:participant)
		@participant.paid.should eq true
	end

	xit "renders event page after charge made" do
		event = create(:event)
		post :create, event_id: event
		expect(response).to redirect_to event
	end
end
