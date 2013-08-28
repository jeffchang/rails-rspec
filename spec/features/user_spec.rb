require 'spec_helper'

feature 'User browsing the website' do

  before(:each) do
    10.times do |n|
      Post.create(title: "Post #{n}", content: "Blah blah blah", is_published: true)
    end
  end

  context "on homepage" do
    it "sees a list of recent posts titles" do
      visit posts_path
      Post.all.each do |post|
        page.should have_content post.title
      end
    end

    it "can click on titles of recent posts and should be on the post show page" do
      visit posts_path
      id = Post.all.first.id
      click_link("#{id}")
      page.should have_content Post.find(id).title
    end 
  end

  context "post show page" do
    it "sees title and body of the post" do
      visit posts_path
      id = Post.all.first.id
      click_link("#{id}")
      page.should have_content Post.find(id).title
      page.should have_content Post.find(id).content
    end
  end
end
