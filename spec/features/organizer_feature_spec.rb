require 'spec_helper'

describe 'Organizer' do
  
  context 'registered members' do

    it 'should start with none' do
      expect(Organizer.all.count).to eq 0
    end

    it 'should create a new Organizer' do
      visit new_organizer_registration_path

      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(current_path).to eq organizer_path(Organizer.last)
      expect(page).to have_css '#notice', text: "Welcome! You have signed up successfully."
    end

  end

  context 'Organizer links' do

    context 'when signed out' do

      before(:each) { visit root_path }

      it 'should have sign in and sign up links' do
        # within '.navbar' do
          expect(page).to have_link 'Sign up'
          expect(page).to have_link 'Sign in'
        # end
      end

      it 'should not have a sign out link' do
        # within '.navbar' do
          expect(page).not_to have_link 'Sign out'
        # end
      end

    end

    context 'when signed in' do

      before(:each) do
        visit new_organizer_registration_path

        # fill_in 'Name', with: 'Ketchup'
        fill_in 'Email', with: 'email@email.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        visit root_path
      end

      it 'should have a sign out link' do
        # within '.navbar' do
          expect(page).to have_link 'Sign out'
        # end
      end

      it 'should not have sign in and sign out links' do
        # within '.navbar' do
          expect(page).not_to have_link 'Sign up'
          expect(page).not_to have_link 'Sign in'
        # end
      end

    end

  end

  context 'has a show page' do
    before do
      organizer = FactoryGirl.create(:organizer)
      login_as(organizer, :scope => :organizer)
      FactoryGirl.create(:event, :organizer_id => organizer.id)
      visit organizer_path(organizer)
    end
    
    it 'should show the organizer email' do
      expect(page).to have_css('h3', text: 'Welcome, a@a.com')
    end

    it 'should show organizer events' do
      expect(page).to have_link 'MyString'
    end

    it 'should show allow organizer to create events' do
      expect(page).to have_link 'Create event'
    end
  end

end
