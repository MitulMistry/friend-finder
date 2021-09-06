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
    it "renders signup form" do
      get signup_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Sign Up")
    end
  end

  describe "POST / (create)" do
    it "creates new user" do
      user = build(:user)
      
      post users_path, params: {
        user: {
          username: user.username,
          password: user.password,
          email: user.email,
          bio: user.bio
        }
      }
      
      expect(response).to have_http_status(302)
      follow_redirect!

      expect(response).to have_http_status(200)
      expect(response.body).to include(user.username)
      expect(response.body).to include(user.bio)
    end
  end

  describe "GET /edit" do
    it "renders edit form" do
      user = create_user_and_login
      get edit_user_path(user)
      expect(response).to have_http_status(200)
      expect(response.body).to include("Edit")
      expect(response.body).to include(user.username)
    end
  end  

  describe "PATCH /:id (update)" do
    it "updates user" do
      user = create_user_and_login
      user_editted = build(:user)

      patch user_path(user), params: {
        user: {
          username: user_editted.username,
          email: user_editted.email,
          bio: user_editted.bio,
          password: "editted"
        }
      }

      expect(response).to redirect_to(user_path(user))
      follow_redirect!

      expect(response).to have_http_status(200)
      expect(response.body).to include(user_editted.username)
      expect(response.body).to include(user_editted.bio)
    end
  end

  describe "DELETE /:id (destroy)" do
    it "deletes user" do
      user = create_user_and_login

      delete user_path(user)

      expect{ User.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)

      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(response).to have_http_status(200)      
    end
  end
end
