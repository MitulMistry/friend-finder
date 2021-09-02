require 'rails_helper'

RSpec.describe UserInterest, type: :model do
  describe "associations" do
    # Using shoulda-matchers
    it { should belong_to(:user) }
    it { should belong_to(:interest) }
  end
end
