require 'rails_helper.rb'

describe "Create Post" do
	scenario "can create a post" do
		visit '/'
		click_link 'New Post'
		attach_file('Image','spec/files/images/coffee.jpg')
		fill_in 'Caption', with: 'smells deliciouse #yummy'
		click_button 'Create Post'
		expect(page).to have_content('#yummy')
		expect(page).to have_css("img[src*='coffee.jpg']")

	end
end
