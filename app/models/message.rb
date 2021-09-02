class Message < ApplicationRecord
  belongs_to :sender, foreign_key: 'sender_user_id', class_name: 'User'
  belongs_to :recipient, foreign_key: 'recipient_user_id', class_name: 'User'

  validates :body, presence: true, length: { maximum: 2000 }
end
