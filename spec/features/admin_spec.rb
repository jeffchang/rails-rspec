require 'spec_helper'

feature 'Admin panel' do

  before(:each) do
    10.times do |n|
      Post.create(title: "Post #{n}", content: "Blah blah blah", is_published: true)
    end
  end

  context "on admin homepage" do
    it "can see a list of recent posts" do
      page.driver.browser.basic_authorize('geek', 'jock')
      visit admin_posts_url
      Post.all.each do |post|
        page.should have_content post.title
      end
    end

    it "can edit a post by clicking the edit link next to a post on the index page" do
      post = Post.all.first
      page.driver.browser.basic_authorize('geek', 'jock')
      visit admin_posts_path
      click_link("#{post.id}")
      page.should have_content post.title
      page.should have_content post.content
    end

    it "can delete a post by clicking the delete link next to a post" do
      post = Post.all.first
      page.driver.browser.basic_authorize('geek', 'jock')
      visit admin_posts_path
      click_link("#{post.id}delete")
      expect { Post.find(post.id) }.to raise_error
    end

    it "can create a new post and view it" do
       visit new_admin_post_url

       expect {
         fill_in 'post_title',   with: "Hello world!"
         fill_in 'post_content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         page.check('post_is_published')
         click_button "Save"
       }.to change(Post, :count).by(1)

       page.should have_content "Published: true"
       page.should have_content "Post was successfully saved."
     end
  end

  context "editing post" do
    it "can mark an existing post as unpublished" do
      post = Post.all.first
      visit edit_admin_post_path(post)
      find("#post_is_published").set(false)
      click_button "Save"
      page.should have_content "Published: false"
    end
  end

  context "on post show page" do
    it "can visit a post show page by clicking the title" do
      post = Post.all.first
      page.driver.browser.basic_authorize('geek', 'jock')
      visit admin_posts_path
      click_link("#{post.id}show")
      page.should have_content post.title
      page.should have_content post.content
    end

    it "can see an edit link that takes you to the edit post path" do
      post = Post.all.first
      visit admin_post_path(post)
      click_link("#{post.id}")
      page.should have_content post.title
      page.should have_content post.content
    end

    it "can go to the admin homepage by clicking the Admin welcome page link" do
      post = Post.all.first
      visit admin_post_path(post)
      page.driver.browser.basic_authorize('geek', 'jock')
      click_link("Admin welcome page")
      page.should have_content "Welcome to the admin panel!"
    end
  end
end
