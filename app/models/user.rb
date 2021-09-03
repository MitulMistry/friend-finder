class User < ApplicationRecord
  has_secure_password

  has_many :user_interests
  has_many :interests, through: :user_interests  
  has_many :sent_messages, foreign_key: 'sender_user_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recipient_user_id', class_name: 'Message'

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 40 }
  validates :password, presence: true

  extend ClassOrderable

  def sent_messages_newest
    self.sent_messages.order(created_at: :desc)
  end

  def received_messages_newest
    self.received_messages.order(created_at: :desc)
  end
end
