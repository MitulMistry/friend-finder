require 'rails_helper'

RSpec.describe Interest, type: :model do
  it "has a valid factory" do
    # Using FactoryBot syntax methods in rails_helper.rb
    expect(build(:interest)).to be_valid
  end

  describe "associations" do
    # Using shoulda-matchers
    it { should have_many(:users) }
  end

  describe "validations" do
    context "required validations" do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_most(100) }
    end
  end

  describe "sort" do
    it "returns an array of all interests sorted alphabetically"

    it "returns a sorted array of interest's users by creation date (newest first)"
  end
end
