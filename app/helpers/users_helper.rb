module UsersHelper
  def user_truncated_bio(user)
    truncate(user.bio, length: 150, separator: /\s/) if user.bio
  end

  def user_card_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(resize: "400x400"), class: "card-img"
    else
      image_tag "default/medium/default_user_avatar.png", class: "card-img"
    end
  end

  def user_profile_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(resize: "400x400"), class: "profile-img"
    else
      image_tag "default/medium/default_user_avatar.png", class: "profile-img"
    end
  end

  def user_message_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(resize: "400x400"), class: "message-img"
    else
      image_tag "default/medium/default_user_avatar.png", class: "message-img"
    end
  end
end
