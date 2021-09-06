module UsersHelper
  def user_truncated_bio(user)
    truncate(user.bio, length: 150, separator: /\s/) if user.bio
  end
end
