class Group < ApplicationRecord
  has_many :group_users
  has_many :group_nates
  has_many :users, through: :group_users

  validates :name, presence: true
end
