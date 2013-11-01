require 'spec_helper'

describe Event do

	it {should belong_to(:organizer)}

	it 'can have an attached image' do
		event = Event.create image: example_image
		expect(event.image.exists?).to be_true	
	end

	it 'can have an different sized images attached' do
		event = Event.create image: example_image
		expect(event.image.exists?(:thumb)).to be_true
	end

	it 'cannot have its deadline set in the past' do
		expect {create(:event, deadline: "2012-10-28 11:35:44")}.to raise_error
	end
end