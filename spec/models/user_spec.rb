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

      it "has an alphanumeric username" do
        expect(build(:user, username: "testUser1")).to be_valid
        expect(build(:user, username: "test-user2")).to be_valid
        expect(build(:user, username: "test_user3")).to be_valid
        expect(build(:user, username: "test user4")).to be_invalid
        expect(build(:user, username: "testUser5$")).to be_invalid
      end
      
      it { should validate_presence_of(:email) }
      it { should validate_length_of(:email).is_at_most(100) }

      it "has a valid email" do
        expect(build(:user, email: "test123@email.com")).to be_valid
        expect(build(:user, email: "test123@email.net")).to be_valid
        expect(build(:user, email: "test123email.net")).to be_invalid
        expect(build(:user, email: "test123 @email.com")).to be_invalid
      end

      it { should have_secure_password }
    end

    context "other validations" do
      it { should validate_length_of(:bio).is_at_most(2000) }
    end
  end

  describe "sort users" do
    before :each do
      @user1 = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)
    end

    it "returns an array of all users sorted by creation date (newest first)" do
      expect(User.ordered_newest).to eq [@user3, @user2, @user1]
    end

    it "returns an array of randomized users (with count based on argument)" do
      expect(User.randomized(2).length).to be(2)
      expect(User.randomized(3).length).to be(3)
      expect(User.randomized(3)).to all(be_a(User))
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
