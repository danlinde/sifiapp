require 'spec_helper'

describe 'event' do


	context 'new event creation' do

		it 'an organiser can create a new event' do
			visit new_event_path

			fill_in 'Name', with: 'Team Lunch Wednesday'
			fill_in 'Description', with: "We are having our lunch delivered this Wednesday"
			fill_in 'Deadline', with: '2013-11-06 11:00'
			fill_in 'Email', with: "ting@tong.com"

			click_button 'Create Event'

			expect(page).to have_content 'You created an event'
		end

		it 'an organiser can choose participants' do
			visit new_event_path

			fill_in 'Name', with: 'Team Lunch Wednesday'
			fill_in 'Description', with: "We are having our lunch delivered this Wednesday"
			fill_in 'Deadline', with: '2013-11-06 11:00'
			fill_in 'Email', with: 'ting@gmail.com'
			fill_in 'First name', with: "Ting"
			fill_in "Last name", with: "Tings"

			click_button 'Create Event'

			expect(page).to have_content 'ting@gmail.com'
			expect(page).to have_content 'Ting Tings'
		end

	end

	context 'view an event' do


		before(:all) do
			@dinner = Event.create({name: "Dinner on Friday", description: "We are going to subway", deadline: "2013-11-08 13:00",
				participants_attributes: [:email => "dan@pan.com", :first_name => "dan", :last_name => "pan"]})

			# @dinner = Event.create({name: "Dinner on Friday", description: "We are going to subway", deadline: "2013-11-08 13:00"})
		end

		it 'an organiser can view an event' do
			visit event_path(@dinner)

			expect(page).to have_css 'h1', text: "Dinner on Friday"
			expect(current_url).to eq url_for(@dinner)
		end

		it 'an organiser can view an event with participants' do
			visit event_path(@dinner)

			expect(page).to have_css 'h1', text: "Dinner on Friday"
			expect(page).to have_css 'li', text: "dan@pan.com"		
		end

	end

end
