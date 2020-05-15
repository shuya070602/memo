class Note < ApplicationRecord
  #会員１対ノート多
  belongs_to :user
  #ジャンル１対ノート多
  #belongs_to :genre

  #題名の空白禁止
  validates :title, presence: true
  #本文の空白禁止、最大200文字
  validates :body, presence: true, length: {maximum: 200}

 def self.search(search)
       if search
          Note.where(['title LIKE ?', "%#{search}%"])
       else
          Note.all
       end
    end
end
