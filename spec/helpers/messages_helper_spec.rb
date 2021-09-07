require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MessagesHelper. For example:
#
# describe MessagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MessagesHelper, type: :helper do
  it "provides readable date and time" do
    date_time = DateTime.parse("3rd Feb 2001 04:05:06+03:30")
    expect(helper.readable_datetime(date_time)).to eq("Saturday, Feb 03, 2001,  4:05 AM")
  end
end
