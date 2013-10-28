require 'spec_helper'

describe 'event' do


	context 'new event creation' do

		it 'an organiser can create a new event' do
			visit new_event_path

			fill_in 'name', with: 'Team Lunch Wednesday'
			fill_in 'Deadline', with: 'Wednesday 10am'
			fill_in 'description', with: "We are having our lunch delivered this Wednesday"

			click_button 'Create Event'

			expect(page).to have_content 'You created an event'
		end

	end

end
