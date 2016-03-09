feature 'viewing user profile' do
	background do
		user1 = create :user
		user2 = create :user, id: 3, user_name:'hashtag', email: 'hash@hash.com'
		post1 = create :post, user_id: user1.id
		post2 = create :post, user_id: user2.id, caption: 'nofilter2'
		sign_in_with_user
		visit '/'
		first('.user-name').click_link 'hashim'
	end
	scenario 'visiting the profile page shows the username in url' do
		expect(page.current_path).to eq(profile_path('hashim'))
	end
	scenario 'A page should only show the current users posts' do
		expect(page).to have_content 'nofilter'
		expect(page).to_not have_content 'nofilter2'
	end
end