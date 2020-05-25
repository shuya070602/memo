class Group < ApplicationRecord
  #グループ１対グループ会員多
  has_many :group_users, dependent: :destroy
  #グループ１対グループノート多
  has_many :group_notes, dependent: :destroy
  #グループ１対会員多
  has_many :users, through: :group_users

  #グループ名の空白禁止
  validates :name, presence: true
end
