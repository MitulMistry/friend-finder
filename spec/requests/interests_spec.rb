require 'rails_helper'

RSpec.describe "Interests", type: :request do
  describe "GET /index" do
    it "lists all interests" do
      interest1 = create(:interest)
      interest2 = create(:interest)
      
      get interests_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(interest1.name)
      expect(response.body).to include(interest2.name)
    end
  end

  describe "GET /:id (show)" do
    it "shows interest by id and lists users" do
      user1 = create(:user)
      user2 = create(:user)
      interest = create(:interest)
      interest.users << user1
      interest.users << user2

      get interest_path(interest)
      expect(response).to have_http_status(200)
      expect(response.body).to include(user1.username)
      expect(response.body).to include(user2.username)
    end
  end  
end
