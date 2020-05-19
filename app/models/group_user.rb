class GroupUser < ApplicationRecord
  #グループ１対グループ会員多
  belongs_to :group
  #会員１対グループ会員多
  belongs_to :user
end
