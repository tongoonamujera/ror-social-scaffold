require 'rails_helper'

RSpec.describe 'User controller', type: :model do
  let(:user1) { User.create(name: 'Tongoona', email: 'tongoona@gmail.com', password: 'aaaaaa') }
  let(:user2) { User.create(name: 'Mujera', email: 'mujera@gmail.com', password: 'aaaaaa') }

  describe 'GET index' do
    it 'populates users' do
      users = User.all
      expect(users).to eq([user1, user2])
    end

    it 'should show user with id 1' do
      user = User.find(user1.id)
      expect(user).to eq(user1)
    end

    it 'should show user with id 1 name' do
      user = User.find(user1.id).name
      expect(user).to eq('Tongoona')
    end

    it 'should show user with id 1 email' do
      user = User.find(user1.id).email
      expect(user).to eq('tongoona@gmail.com')
    end
  end
end
