require 'spec_helper'
# binding.pry

describe 'User' do
  context "on homepage" do
    it "sees a list of recent posts titles" do
      visit posts_path
      page.should have_content(Post.first.title)
      page.should have_content(Post.first.content)
    end
    
    it "can not see bodies of the recent posts" do
      pending
      # given a user and a list of posts
      # user visits the homepage
      # user should not see the posts bodies
    end
    it "can click on titles of recent posts and should be on the post show page" do
      pending
      # given a user and a list of posts
      # user visits the homepage
      # when a user can clicks on a post title they should be on the post show page
    end
    it "can not see the edit link" do
      pending
      # given a user and a list of posts
      # user visits the homepage
      # user should not see any edit links
    end
    it "can not see the delete link" do
      pending
      # given a user and a list of posts
      # user visits the homepage
      # user should not see any delete links
    end
  end

  context "post show page" do
    it "sees title and body of the post" do
      pending
      # given a user and post(s)
      # user visits the post show page
      # user should see the post title
      # user should see the post body
    end
    it "can not see the edit link" do
      pending
      # given a user and post(s)
      # user visits the post show page
      # user should not see the post edit link
    end
    it "can not see the published flag" do
      pending
      # given a user and post(s)
      # user visits the post show page
      # user should not see the published flag content
    end
    it "can not see the Admin homepage link" do
      pending
      # given a user and post(s)
      # user visits the post show page
      # user should not see the the admin homepage link
    end
  end
end
