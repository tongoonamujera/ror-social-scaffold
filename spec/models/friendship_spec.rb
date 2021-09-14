require 'rails_helper'

RSpec.describe 'Friendship', type: :model do
  let(:first_user) { User.create(name: 'rspec1', email: 'rspec1@test.com', password: '123456') }
  let(:second_user) { User.create(name: 'rspec2', email: 'rspec2@test.com', password: '123456') }
  let(:friendship) { Friendship.create(user_id: first_user.id, friend_id: second_user.id, confirmed: false) }
  let(:user) { Friendship.reflect_on_association(:user).macro }
  let(:friend) { Friendship.reflect_on_association(:friend).macro }

  it 'should check if creating friendship is correct' do
    expect(friendship).to be_valid
  end

  it 'should check if friendship belongs_to user' do
    expect(user).to eq(:belongs_to)
  end

  it 'should check if friendship belongs_to friend' do
    expect(friend).to eq(:belongs_to)
  end
end