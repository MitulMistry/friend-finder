require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "lists users" do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)

      get users_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(user1.username)
      expect(response.body).to include(user2.username)
      expect(response.body).to include(user3.username)
    end
  end

  describe "GET /:id (show)" do
    it "shows user by id" do
      user = create(:user)

      get user_path(user)
      expect(response).to have_http_status(200)
      expect(response.body).to include(user.username)
      expect(response.body).to include(user.bio)
    end
  end

  describe "GET /signup (new)" do
    it "renders signup form template" do
      get signup_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST / (create)" do
    it "creates new user"
  end

  describe "GET /edit" do
    it "renders edit form template"
  end  

  describe "PATCH /:id (update)" do
    it "updates user"
  end

  describe "DELETE /:id (destroy)" do
    it "deletes user"
  end
end
