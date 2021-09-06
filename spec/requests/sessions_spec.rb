require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login (new)" do
    it "renders login form" do
      get login_path      
      expect(response).to have_http_status(200)
      expect(response.body).to include("Login")
    end
  end

  describe "POST / (create)" do
    it "creates new session" do
      password = "password"
      user = create(:user, password: password)

      post sessions_path, params: {
        username: user.username,
        password: password
      }

      expect(response).to redirect_to(user_path(user))
      follow_redirect!

      expect(response.body).to include(user.username)
    end
  end

  describe "DELETE /logout (destroy)" do
    it "deletes session" do
      # user = create(:user)

      # login(user)
      # request.session[:user_id] = user.id

      user = create_user_and_login

      delete logout_path
      expect(response).to redirect_to(login_path)
      follow_redirect!
      expect(response.body).to include("Login")
    end
  end  
end
