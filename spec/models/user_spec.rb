RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).class_name('Post') }
    it { should have_many(:comments).class_name('Comment') }
    it { should have_many(:likes) }
    it { should have_many(:friendships).class_name('Friendship') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'Creating user' do
    subject { User.create(name: 'tongoona', email: 'tongoona@microverse.org', password: '123456789') }

    it 'it dont return other name than tongoona' do
      expect(subject.name).to_not eq('Oscar')
    end

    it 'email have email format' do
      expect(subject.email).to match(/[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/)
    end
  end
end