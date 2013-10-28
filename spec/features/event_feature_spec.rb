require 'spec_helper'

describe 'event' do


	context 'new event creation' do

		it 'an organiser can create a new event' do
			visit new_event_path

			fill_in 'Name', with: 'Team Lunch Wednesday'
			fill_in 'Deadline', with: 'Wednesday 10am'
			fill_in 'Description', with: "We are having our lunch delivered this Wednesday"

			click_button 'Create Event'

			expect(page).to have_content 'You created an event'
		end

		it 'we can view the event that was created' do

			visit

		end
	end

end
