# create a post with factory_girl
# visit '/'
# click on an image link
# expect to be taken to the show page of our post
require 'rails_helper.rb'
feature "Index Page" do 
	
	it "should go to show page on image click" do
		post = create(:post)
		visit '/'

		# puts find(:xpath, "//a[contains(@href,'posts/1')]").inspect
		find(:xpath, "//a[contains(@href,'posts/1')]").click
		
    	expect(page.current_path).to eq(post_path(post))

	end
	
end