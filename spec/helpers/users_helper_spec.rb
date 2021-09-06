require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  context "with text over character limit" do
    it "truncates writer bio to 150 characters" do
      user = create(:user, bio: Faker::Lorem.characters(number: 175))
      expect(helper.user_truncated_bio(user).length).to eq(150)
    end
  end

  context "with text below character limit" do
    it "doesn't truncate writer bio" do
      user = create(:user, bio: Faker::Lorem.characters(number: 100))
      expect(helper.user_truncated_bio(user).length).to eq(100)
    end
  end
end
