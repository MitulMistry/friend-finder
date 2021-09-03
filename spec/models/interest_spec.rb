require 'rails_helper'

RSpec.describe Interest, type: :model do
  it "has a valid factory" do
    # Using FactoryBot syntax methods in rails_helper.rb
    expect(build(:interest)).to be_valid
  end

  describe "associations" do
    # Using shoulda-matchers
    it { should have_many(:user_interests) }
    it { should have_many(:users) }
  end

  describe "validations" do
    context "required validations" do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_most(100) }
    end
  end

  describe "sort" do
    it "returns an array of all interests sorted alphabetically" do
      interest1 = create(:interest, name: "Z Interest")
      interest2 = create(:interest, name: "A Interest")
      interest3 = create(:interest, name: "D Interest")

      expect(Interest.ordered_alphabetized).to eq [interest2, interest3, interest1]
    end

    it "returns a sorted array of interest's users by creation date (newest first)" do
      interest = create(:interest)
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      interest.users << user1
      interest.users << user2
      interest.users << user3

      expect(interest.users_ordered_newest).to eq [user3, user2, user1]
    end
  end
end
