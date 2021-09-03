require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    # Using FactoryBot syntax methods in rails_helper.rb
    expect(build(:user)).to be_valid
  end

  describe "associations" do
    # Using shoulda-matchers
    it { should have_many(:user_interests) }
    it { should have_many(:interests) }
    it { should have_many(:sent_messages) }
    it { should have_many(:received_messages) }
  end

  describe "validations" do
    context "required validations" do
      it { should validate_presence_of(:username) }
      it { should validate_length_of(:username).is_at_least(3).is_at_most(40) }
      it { should validate_uniqueness_of(:username) }
      it { should have_secure_password }
    end
  end

  describe "sort users" do
    it "returns an array of all users sorted by creation date (newest first)" do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)

      expect(User.ordered_newest).to eq [user3, user2, user1]
    end
  end

  describe "sort messages" do
    before :each do
      @user = create(:user)
    end

    it "returns an array of all sent messages sorted by creation date (newest first)" do
      message1 = create(:message, sender: @user)
      message2 = create(:message, sender: @user)
      message3 = create(:message, sender: @user)

      expect(@user.sent_messages_newest).to eq [message3, message2, message1]
    end
    
    it "returns an array of all receieved messages sorted by creation date (newest first)" do
      message1 = create(:message, recipient: @user)
      message2 = create(:message, recipient: @user)
      message3 = create(:message, recipient: @user)

      expect(@user.received_messages_newest).to eq [message3, message2, message1]
    end
  end
end
