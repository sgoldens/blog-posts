require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @post = Post.create(title: 'Any title', content: 'Any content')      
    end

    it 'can be created' do
      expect(@post).to be_valid
    end    

    it 'cannot be created without a title, and content' do
      @post.title = nil
      @post.content = nil
      expect(@post).to_not be_valid
    end
  end

  describe "Updating" do
    before do
      @post = Post.create(title: 'Any title', content: 'Any content')      
    end

    it 'can be updated by title' do
      @post.title = 'Updated title'
      expect(@post.title).to_equal 'Updated title'
    end

    it 'can be updated by content' do
      @post.title = 'Updated content'
      expect(@post.title).to_equal 'Updated content'
    end

end