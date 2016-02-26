require 'rails_helper.rb'

feature 'Creating comments' do
	scenario 'can comment on existing post' do
		user = create(:user)
		post = create(:post, user_id: user.id)
		sign_in_with user
		visit '/'
		fill_in 'comment', with: ';P'
		click_button 'Submit'
		expect(page).to have_content(';P')

	end
end