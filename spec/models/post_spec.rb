require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @post = Post.create(title: 'Any title', categories: 'any,categories', content: 'Any content')      
    end

    it 'can be created' do
      expect(@post).to be_valid
    end    

    it 'cannot be created without a title, categories, and content' do
      @post.title = nil
      @post.categories = nil
      @post.content = nil
      expect(@post).to_not be_valid
    end
  end

  describe "Updating" do
    before do
      @post = Post.create(title: 'Any title', categories: 'any,categories', content: 'Any content')      
    end  

end