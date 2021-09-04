class Interest < ApplicationRecord
  has_many :user_interests
  has_many :users, through: :user_interests

  validates :name, presence: true, length: { maximum: 100 }

  extend ClassOrderable

  def self.ordered_alphabetized
    order(:name)
  end

  def users_ordered_newest
    self.users.order(created_at: :desc)
  end
end
