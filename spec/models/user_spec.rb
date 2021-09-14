require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'rspec', email: 'rspec@test.com', password: '123456') }
  let(:created_user) { User.create(name: '', email: 'tongoona@test.com', password: '123456789') }
  let(:posts) { User.reflect_on_association(:posts).macro }
  let(:comments) { User.reflect_on_association(:comments).macro }
  let(:likes) { User.reflect_on_association(:likes).macro }
  let(:friendships) { User.reflect_on_association(:friendships).macro }

  it 'checks user validity' do
    @user = User.create(name: 'tongoona', email: 'tongoona@test.com', password: '123456789')
    expect(@user).to be_valid
  end

  it 'user name must not be empty' do
    expect(created_user).to_not be_valid
  end

  it 'Should check correct association' do
    expect(posts).to eq(:has_many)
  end

  it 'should check correct association' do
    expect(comments).to eq(:has_many)
  end

  it 'should check correct association' do
    expect(likes).to eq(:has_many)
  end

  it 'should check correct association' do
    expect(friendships).to eq(:has_many)
  end
end
