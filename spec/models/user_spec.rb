require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    it 'is successfull create user' do
      user = create(:user)
      expect(User.count).to eq 1
    end
  end

  describe 'validation' do
    it 'is valid with all attributes' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    context 'name attribute' do
      it 'is invalid without name' do
        user_without_name = build(:user, name: '')
        expect(user_without_name).to be_invalid
        expect(user_without_name.errors[:name]).to include("can't be blank")
      end

      it 'is invalid with a duplicate name' do 
        user = create(:user)
        user_dublicated_name = build(:user, name: user.name)
        expect(user_dublicated_name).to be_invalid
        expect(user_dublicated_name.errors[:name]).to include("他のニックネームをお試しください。")
      end

      it 'is invalid less than 6 length name' do
        user_short_name = build(:user, name: ('a' * 3))
        expect(user_short_name).to be_invalid
        expect(user_short_name.errors[:name]).to include("is too short (minimum is 6 characters)")
      end

      it 'is invalid more than 20 length name' do
        user_long_name = build(:user, name: ('a' * 21))
        expect(user_long_name).to be_invalid
        expect(user_long_name.errors[:name]).to include("is too long (maximum is 20 characters)")
      end
    end

    context 'password' do
      it 'is invalid without password' do
        user_without_password = build(:user, password: '')
        expect(user_without_password).to be_invalid
        expect(user_without_password.errors[:password]).to include("can't be blank")
      end

      it 'is invalid with does not match password' do
        user_another_password_confirmation = build(:user, password_confirmation: 'dummypassword')
        expect(user_another_password_confirmation).to be_invalid
        expect(user_another_password_confirmation.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end
