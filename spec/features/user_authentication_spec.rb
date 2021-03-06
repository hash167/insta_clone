require 'rails_helper.rb'
feature 'User authentication' do  
  background do
    user = create(:user)
  end
  scenario 'can log in from the index' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'idlesoul@gmail.com'
    fill_in 'Password', with: 'topsecret'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end
  scenario 'can log out once logged in' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'idlesoul@gmail.com'
    fill_in 'Password', with: 'topsecret'
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end
end  