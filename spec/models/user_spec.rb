require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creation' do
    before do
      @user = User.create(name: 'tester', email: '123@test.com', password: '123456')
    end
    
    it 'new users can be created' do
      expect(@user).to be_valid
    end
  end
end
