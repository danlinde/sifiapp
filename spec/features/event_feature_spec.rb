require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'event' do

	before do
		pwd = '12345678'
		organizer = Organizer.create(email: 'b@b.com', password: pwd, password_confirmation: pwd)
		login_as organizer
	end


	context 'new event creation' do

		it 'an organiser can create a new event' do
			visit new_event_path

			fill_in 'Name', with: 'Team Lunch Wednesday'
			fill_in 'Description', with: "We are having our lunch delivered this Wednesday"
			fill_in 'Deadline', with: "2013-12-05 00:00:00"
			fill_in 'event[participant_emails]', with: "ting@tong.com, dave@dave.com"
			fill_in 'Link', with: "http://google.com"
            click_button 'Create Event'

            event = Event.last
            raise event
            expect(current_path).to eq event_path(event.id)
            expect(page).to have_content 'Team Lunch Wednesday'
            expect(page).to have_content 'ting@gmail.com'
			expect(page).to have_content 'dave@dave.com'
           
		end


		# it 'an organiser can choose participants' do
		# 	visit new_event_path

		# 	fill_in 'Name', with: 'Team Lunch Wednesday'
		# 	fill_in 'Description', with: "We are having our lunch delivered this Wednesday"
		# 	fill_in 'Deadline', with: "2013-12-05 00:00:00"
		# 	fill_in 'event[participant_emails]', with: 'ting@gmail.com, dave@dave.com,'

		# 	click_button 'Create Event'
		# 	expect(current_url).to eq url_for(Event.last)

		# 	expect(page).to have_content 'ting@gmail.com'
		# 	expect(page).to have_content 'dave@dave.com'
		# end

	end

	context 'view an event' do


		before(:each) do
			create_dinner
		end

		it 'an organiser or participant can view an event' do
			visit event_path(@dinner)

			expect(page).to have_css 'h3', text: "Dinner on Friday"
			expect(current_url).to eq url_for(@dinner)
		end

		it 'an organiser or participant can view an event with participants' do
			visit event_path(@dinner)

			expect(page).to have_css 'h3', text: "Dinner on Friday"
			expect(page).to have_css 'li', text: "ting@ting.com"		
		end

		it 'a participant cannot see edit and delete buttons' do
			expect(page).not_to have_link 'Edit event'
			expect(page).not_to have_button 'Delete event'
		end

	end

	context 'make changes to an event' do

		before(:each) do
			organizer = FactoryGirl.create(:organizer)
			@event = FactoryGirl.create(:event, organizer: organizer)
			login_as(organizer, :scope => :organizer)
		end

		it 'an organiser can delete an event' do
			visit event_path(@event)
			click_button "Delete Event"
			current_path.should == root_path
		end

		it 'an organiser can edit an event' do
			visit event_path(@event)
			click_link "Edit event"
			fill_in "Name", with: "Renamed event"
			click_button "event_form_submit"
			expect(page).to have_content "Renamed event"
		end

	end

end
