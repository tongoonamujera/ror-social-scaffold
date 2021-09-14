require 'rails_helper'

RSpec.describe 'Friendship', type: :model do
  let(:first_user) { User.create(name: 'tongo1', email: 'tongo1@test.com', password: '1234567890') }
  let(:second_user) { User.create(name: 'tongo2', email: 'tongo2@test.com', password: '1234567890') }
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