require 'spec_helper'

describe 'Organizer' do
  
  context 'registered members' do

    it 'should start with none' do
      expect(Organizer.all.count).to eq 0
    end

    it 'should create a new Organizer' do
      visit new_organizer_registration_path

      # fill_in 'Name', with: 'Ketchup'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(current_path).to eq root_path
      expect(page).to have_css('.notice', text: "Welcome! You have signed up successfully.")
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

end
