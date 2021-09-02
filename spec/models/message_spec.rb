require 'rails_helper'

RSpec.describe Message, type: :model do
  it "has a valid factory" do
    # Using FactoryBot syntax methods in rails_helper.rb
    expect(build(:message)).to be_valid
  end

  describe "associations" do
    # Using shoulda-matchers
    it { should belong_to(:sender) }
    it { should belong_to(:recipient) }
  end

  describe "validations" do
    context "required validations" do
      it { should validate_presence_of(:body)}
      it { should validate_length_of(:body).is_at_most(2000)}
    end
  end
end
