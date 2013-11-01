require 'spec_helper'

describe 'when I create an event' do
  # let(:birthday_party) {create(:event)} 

  it 'can have an uploaded event image' do
  	organizer = FactoryGirl.create(:organizer)
	login_as(organizer, :scope => :organizer)
	  
	visit new_event_path

	fill_in 'Name', with: 'Party'
	fill_in 'Description', with: "big party"
	fill_in 'event[participant_emails]', with: 'd@d.com, a@a.com'
	select '2014', from: 'event[deadline(1i)]'

	attach_file "Image", example_image_path
	click_button "Create Event"

	expect(page).to have_css 'img.event_image'
  end
end