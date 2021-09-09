# For URI.open
require 'uri'

class User < ApplicationRecord
  has_secure_password

  has_many :user_interests
  has_many :interests, through: :user_interests  
  has_many :sent_messages, foreign_key: 'sender_user_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recipient_user_id', class_name: 'Message'

  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 40 }, format: { with: /\A[a-zA-Z0-9_-]+\Z/ }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :bio, length: { maximum: 2000 }

  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.megabytes }

  extend ClassOrderable

  # Save model after calling method
  def avatar_from_url(url)
    self.avatar.attach(io: URI.open(url), filename: "generated-avatar.jpg")
  end

  def sent_messages_newest
    self.sent_messages.order(created_at: :desc)
  end

  def received_messages_newest
    self.received_messages.order(created_at: :desc)
  end
end
