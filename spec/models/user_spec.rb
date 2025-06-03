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
    
    it "is not valid with empty first name fields" do
      @user = User.new(
        f_name: nil,
        l_name: 'Doe',
        email: 'John@doe.com',
        password: 'easypasssword123',
        password_confirmation: 'easypasssword123'
      )

      @user.valid?
      expect(@user.errors.full_messages).to include("F name can't be blank")
    end

    it "is not valid with empty last name fields" do
      @user = User.new(
        f_name: 'John',
        l_name: nil,
        email: 'John@doe.com',
        password: 'easypasssword123',
        password_confirmation: 'easypasssword123'
      )

      @user.valid?
      expect(@user.errors.full_messages).to include("L name can't be blank")
    end

    it "is not valid with empty email fields" do
      @user = User.new(
        f_name: 'John',
        l_name: 'Doe',
        email: nil,
        password: 'easypasssword123',
        password_confirmation: 'easypasssword123'
      )

      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid with password length less than 8 characters" do
      @user = User.new(
        f_name: 'John',
        l_name: 'Doe',
        email: 'John@doe.com',
        password: '12345',
        password_confirmation: '12345'
      )

      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it "is valid with password length of more than 8 characters" do
      @user = User.new(
        f_name: 'John',
        l_name: 'Doe',
        email: 'John@doe.com',
        password: '1234578910',
        password_confirmation: '1234578910'
      )

      @user.valid?
      expect(@user).to be_valid
    end
  end
  
  describe 'authenticate_with_credentials' do
    before do
      @user = User.create(
        f_name: 'John',
        l_name: 'Doe',
        email: 'test@test.com',
        password: 'easypasssword123',
        password_confirmation: 'easypasssword123'
      )
    end
      
    it "authenticates user successfully with different cased email" do
      authenticated_user = User.authenticate_with_credentials('TEST@TEST.com', 'easypasssword123')
      expect(authenticated_user).to eq(@user)
    end

    it "authenticates user successfully with white spaced email" do
      authenticated_user = User.authenticate_with_credentials('   test@test.com  ', 'easypasssword123')
      expect(authenticated_user).to eq(@user)
    end
  end

end
