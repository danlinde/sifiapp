require 'spec_helper'

describe 'Homepage' do
	context 'first visit or when not logged in' do
		it 'should not show you a link to your events page' do
			expect(page).not_to have_link "View your events page"
		end
	end

	context 'when organizer is logged in' do
		before do
			organizer = FactoryGirl.create(:organizer)
			login_as(organizer, :scope => :organizer)
			visit root_path
		end

		it 'should link to organizers event page' do
			expect(page).to have_link "View your events page"
			
		end

		it 'should allow you to create a new event' do
			expect(page).to have_link "Create an event now"
		end
	end
end
