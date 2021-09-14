require 'rails_helper'

RSpec.describe 'Post controller', type: :model do
  let(:user1) { User.create(name: 'Tongoona', email: 'tongoona@gmail.com', password: 'aaaaaa') }
  let(:user2) { User.create(name: 'Mujera', email: 'mujera@gmail.com', password: 'aaaaaa') }
  let(:post1) { Post.create!(content: 'Heyy thats my first post', user_id: user1.id) }
  let(:post2) { Post.create!(content: 'Heyy thats my second post', user_id: user2.id) }

  describe 'GET index' do
    it 'populates posts' do
      posts = Post.all
      expect(posts).to eq([post1, post2])
    end

    it 'should show post with id 1' do
      post = Post.find(post1.id)
      expect(post).to eq(post1)
    end

    it 'should show post content with id 1' do
      post = Post.find(post1.id).content
      expect(post).to eq('Heyy thats my first post')
    end

    it 'should show id of post creator' do
      post = Post.find(post1.id).user_id
      expect(post).to eq(user1.id)
    end
  end
end