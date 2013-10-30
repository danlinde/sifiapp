require 'spec_helper'

describe 'an invitation email to each participants' do

  it 'is send when an event is created' do
    expect { create_dinner }.to change { emails.count }.by 1
  end

  context 'dinner has already been created' do

  	before(:all) { create_dinner }

	  it 'should have subject "An Invitation"'  do
	  	expect(emails.last.subject).to eq "An Invitation"
	  end

	  it 'should include the link of the event page' do
	  	 expect(emails.last.body).to include edit_event_participant_path(@dinner, @dinner.participants.last)
	  	    # has_xpath?('//table/tr')
	  	    
	  end  

  end

end