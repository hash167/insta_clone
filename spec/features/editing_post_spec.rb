# create a job with factory_girl
# visit the root route
# click the image of the post we created with factory_girl
# click the 'edit post' link
# fill in 'Caption' with "Oh god, you weren’t meant to see this picture!"
# click the ’Update Post’ button
# expect the page to have content saying "Post updated hombre."
# expect the page to have content saying “Oh god, you weren’t meant to see this picture!”
require 'rails_helper.rb'

feature 'Editing Post' do
	scenario 'should succeed when user tries edit post' do
		post = create(:post)
		visit '/'
		find(:xpath, "//a[contains(@href,'posts/1')]").click
		click_link 'Edit Post'
		fill_in 'Caption', with: 'Updating Post'
		click_button 'Update Post'
		expect(page).to have_content 'Post updated'
		expect(page).to have_content 'Updating Post'


	end
end