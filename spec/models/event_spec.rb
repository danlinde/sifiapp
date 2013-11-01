require 'spec_helper'

describe Event do

	it {should belong_to(:organizer)}

	it 'can have an attached image' do
		event = FactoryGirl.create(:event, image: example_image)
		expect(event.image.exists?).to be_true	
	end

	it 'can have an different sized images attached' do
		event = FactoryGirl.create(:event, image: example_image)
		expect(event.image.exists?(:thumb)).to be_true
	end

	it 'cannot have its deadline set in the past' do
		expect(build(:event, deadline: "2012-10-28 11:00:00")).not_to be_valid
	end

end