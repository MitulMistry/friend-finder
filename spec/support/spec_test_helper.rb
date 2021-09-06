module SpecTestHelper

  # Set user = create_user_and_login, when calling method
  def create_user_and_login
    password = Faker::Internet.password(min_length: 6, max_length: 20)
    user = create(:user, password: password)

    post sessions_path, params: {
      username: user.username,
      password: password
    }

    # Return created user after logging in
    user
  end
end