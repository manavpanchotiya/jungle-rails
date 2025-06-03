require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validation' do
    it "is valid when password and password_confirmation match" do
      @user = User.new(
        f_name: 'John',
        l_name: 'Doe',
        email: 'John@doe.com',
        password: 'easypassword123',
        password_confirmation: 'easypassword123'
      )

      @user.valid?
      expect(@user).to be_valid
    end
  
    it "is not valid when password and password_confirmation do not match" do
      @user = User.new(
        f_name: 'John',
        l_name: 'Doe',
        email: 'John@doe.com',
        password: 'easypassword123',
        password_confirmation: 'easypassword122'
      )

      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it "is not valid with empty password fields" do
      @user = User.new(
        f_name: 'John',
        l_name: 'Doe',
        email: 'John@doe.com',
        password: nil,
        password_confirmation: nil
      )

      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid with same email but with different case" do
      @user1 = User.create(
        f_name: 'John',
        l_name: 'Doe',
        email: 'test@test.com',
        password: 'easypasssword123',
        password_confirmation: 'easypasssword123'
      )
      expect(@user1).to be_persisted

      @user2 = User.new(
        f_name: 'John',
        l_name: 'Doe',
        email: 'TEST@TEST.COM',
        password: 'easypasssword123',
        password_confirmation: 'easypasssword123'
      )
    
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
 
  
  end
  
end
