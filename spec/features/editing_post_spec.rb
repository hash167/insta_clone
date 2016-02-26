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
	background do
    	user  = create :user
    	post = create(:post)
    	user2 = create(:user, user_name: 'Bart',email:'bart@visionproduceco.com',password: 'topsecret',id: 3)
		post2 = create(:post, caption: 'Hello World', user_id: 3)
		sign_in_with(user)
		visit '/'
 	end
	scenario 'should succeed when user tries edit post' do
		find(:xpath, "//a[contains(@href,'posts/1')]").click
		click_link 'Edit Post'
		fill_in 'Caption', with: 'Updating Post'
		click_button 'Update Post'
		expect(page).to have_content 'Post updated'
		expect(page).to have_content 'Updating Post'
	end
	scenario 'should not succed when user tries to edit another users post' do
		find(:xpath, "//a[contains(@href,'posts/2')]").click
		expect(page).to_not have_content('Edit Post')
	end

	scenario "cannot edit a post that doesn't belong to you via url path" do
	    visit "/posts/2/edit"
	    expect(page.current_path).to eq root_path
	    expect(page).to have_content("That post doesn't belong to you!")
  end
end