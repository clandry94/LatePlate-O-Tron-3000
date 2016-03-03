require 'spec_helper'

describe User do

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a first_name" do
    FactoryGirl.build(:user, first_name: nil).should_not be_valid
  end

  it "is invalid without a last_name" do
    FactoryGirl.build(:user, last_name: nil).should_not be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:user, email_address: nil).should_not be_valid
  end

  it "is invalid without a properly formatted email" do
    FactoryGirl.build(:user, email_address: "johndoe@").should_not be_valid
    FactoryGirl.build(:user, email_address: "john").should_not be_valid
    FactoryGirl.build(:user, email_address: "@.com").should_not be_valid
  end

  it "is invalid without a phone_number" do
    FactoryGirl.build(:user, phone_number: nil).should_not be_valid
  end

  it "is invalid without a 10 digit phone number"
    #FactoryGirl.build(:user, phone_number: "281-").should_not be_valid
    #FactoryGirl.build(:user, phone_number: "281/2914921").should_not be_valid
    #FactoryGirl.build(:user, phone_number: "55555555555").should_not be_valid

  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil, password_confirmation: nil).should_not be_valid
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end

  it "is invalid without a confirmation password" do
    FactoryGirl.build(:user, password_confirmation: nil).should_not be_valid
  end

  it "is invalid without a password with length > 8" do
    FactoryGirl.build(:user, password: "badpass", password_confirmation: "badpass").should_not be_valid
  end
end
