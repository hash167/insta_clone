require 'rails_helper.rb'

feature 'User Authorization' do
	scenario 'need to login to view index page' do
		visit '/'
		expect(page).to have_content('You need to sign in or sign up before continuing.')
	end
	scenario 'you need to login to submit a post' do
		visit new_post_path
		expect(page).to have_content('You need to sign in or sign up before continuing.')
	end
end