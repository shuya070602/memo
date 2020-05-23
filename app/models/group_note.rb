class GroupNote < ApplicationRecord
  #グループ１対グループノート多
  belongs_to :group

  #題名の空白禁止
  validates :title, presence: true
  #本文の空白禁止、最大200文字
  validates :body, presence: true, length: {maximum: 200}

 #検索機能、部分一致も可能
 def self.search(search, group_id)
       if search
          GroupNote.where(group_id: group_id).where(['title LIKE ?', "%#{search}%"])
       else
          GroupNote.where(group_id: group_id)
       end
    end
end
