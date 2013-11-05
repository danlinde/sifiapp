require 'spec_helper'

describe 'when I create an event' do
  # let(:birthday_party) {create(:event)} 

  it 'can have an uploaded event image' do
  	organizer = FactoryGirl.create(:organizer)
	login_as(organizer, :scope => :organizer)
	  
	visit new_event_path

	fill_in 'event[name]', with: 'Party'
	fill_in 'Description', with: "big party"
	fill_in 'event[participant_emails]', with: 'd@d.com, a@a.com'
	fill_in 'event[deadline]', with: "2013-12-05 00:00:00"
	attach_file "Image", example_image_path
	click_button "Forget It"

	expect(page).to have_css 'img.event_image'
	expect(page).to have_content 'Your Events'
  end
end