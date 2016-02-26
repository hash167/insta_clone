require 'rails_helper.rb'

feature "Create Post" do
	background do
		user = create :user
		sign_in_with(user)
	end
	scenario "can create a post" do
		
		click_link 'New Post'
		attach_file('Image','spec/files/images/coffee.jpg')
		fill_in 'Caption', with: 'smells deliciouse #yummy'
		click_button 'Create Post'
		expect(page).to have_content('#yummy')
		expect(page).to have_css("img[src*='coffee.jpg']")
		expect(page).to have_content('hashim')

	end

	scenario "needs an image to create post" do

		
		click_link 'New Post'
		fill_in 'Caption', with: 'smells deliciouse #yummy'
		click_button 'Create Post'
		expect(page).to have_content('You need an image to post here!')
	end
end
