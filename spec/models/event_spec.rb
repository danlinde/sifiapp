require 'spec_helper'

describe Event do
  it 'can have an attached image' do
    event = Event.create image: example_image
    expect(event.image.exists?).to be_true	
  end

	it 'can have an different sized images attached' do
	  event = Event.create image: example_image
	  expect(event.image.exists?(:thumb)).to be_true
	end
end