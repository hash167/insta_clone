# Visit the home page
# Click the 'Register' link
# Fill in the 'User name' field with ’sxyrailsdev'
# Fill in the 'Email' field with 'sxyrailsdev@myspace.com'
# Fill in the 'Password' field with 'supersecret'
# Fill in the 'Password confirmation' field with 'supersecret'
# Click the 'Sign up' button
# Expect the page to have the message 'Welcome! You have signed up successfully.'

require 'rails_helper.rb'

feature "Creating a new user" do
	background do
		visit '/'
		click_link 'Register'
	end
	scenario "can create a new user from Index page" do
		fill_in 'User name', with: 'railsdev'
		fill_in 'Email', 	 with: 'hashim@visionproduceco.com'
		fill_in 'Password',	 with: 'supersecret', match: :first
		fill_in 'Password confirmation', with: 'supersecret'
		click_button 'Sign up'
		expect(page).to have_content('Welcome! You have signed up successfully.')
	end
	scenario 'requires a user name to successfully create an account' do
	    fill_in 'Email', with: 'hashim@visionproduceco.com'
	    fill_in 'Password', with: 'supersecret', match: :first
	    fill_in 'Password confirmation', with: 'supersecret'

	    click_button 'Sign up'
	    expect(page).to have_content("can't be blank")
    end
    scenario 'requires a user name to be more than 4 characters' do
	    fill_in 'User name', with: 'h'
	    fill_in 'Email', with: 'hashim@visionproduceco.com'
	    fill_in 'Password', with: 'supersecret', match: :first
	    fill_in 'Password confirmation', with: 'supersecret'

	    click_button 'Sign up'
	    expect(page).to have_content('minimum is 4 characters')
	 end
	 scenario 'requires a user name to be less than 12 characters' do
	    fill_in 'User name', with: 'hhhhhhhhhhhhhhh' 
	    fill_in 'Email', with: 'hashim@visionproduceco.com'
	    fill_in 'Password', with: 'supersecret', match: :first
	    fill_in 'Password confirmation', with: 'supersecret'

	    click_button 'Sign up'
	    expect(page).to have_content("maximum is 12 characters")
    end
end