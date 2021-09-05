require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /index" do
    it "lists three users" do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)

      get root_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(user1.username)
      expect(response.body).to include(user2.username)
      expect(response.body).to include(user3.username)
    end
  end
end
