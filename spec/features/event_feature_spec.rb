require 'spec_helper'

describe 'event' do


	context 'new event creation' do

		it 'an organiser can create a new event' do
			visit new_event_path

			fill_in 'Name', with: 'Team Lunch Wednesday'
			fill_in 'Description', with: "We are having our lunch delivered this Wednesday"
			fill_in 'Deadline', with: '2013-11-06 11:00'
			fill_in 'Link', with: "http://google.com"

			click_button 'Create Event'

			expect(page).to have_content 'You created an event'
		end

	end

	context 'view an event' do

		before(:all) do
			@dinner = Event.create({name: "Dinner on Friday", description: "We are going to subway", deadline: "2013-11-08 13:00"})
		end

		it 'an organiser can view an event' do
			visit event_path(@dinner)

			expect(page).to have_css 'h1', text: "Dinner on Friday"
			expect(current_url).to eq url_for(@dinner)
		end

	end

end
