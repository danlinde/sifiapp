require 'spec_helper'

describe 'User' do
  
  context 'registered members' do

    it 'should start with none' do
      expect(User.all.count).to eq 0
    end

    it 'should create a new user' do
      visit new_user_registration_path

      fill_in 'Name', with: 'Ketchup'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(current_path).to eq root_path
      expect(page).to have_css('.alert', text: "You're ready to spread.")
    end

  end

  context 'user links' do

    context 'when signed out' do

      before(:each) { visit root_path }

      it 'should have sign in and sign up links' do
        within '.navbar' do
          expect(page).to have_link 'Sign up'
          expect(page).to have_link 'Sign in'
        end
      end

      it 'should not have a sign out link' do
        within '.navbar' do
          expect(page).not_to have_link 'Sign out'
        end
      end

    end

    context 'when signed in' do

      before(:each) do
        visit new_user_registration_path

        fill_in 'Name', with: 'Ketchup'
        fill_in 'Email', with: 'email@email.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        visit root_path
      end

      it 'should have a sign out link' do
        within '.navbar' do
          expect(page).to have_link 'Sign out'
        end
      end

      it 'should not have sign in and sign out links' do
        within '.navbar' do
          expect(page).not_to have_link 'Sign up'
          expect(page).not_to have_link 'Sign in'
        end
      end

    end

  end

end
