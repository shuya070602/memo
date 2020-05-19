class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #会員１対ノート多
  has_many :notes, dependent: :destroy
  #会員１対ジャンル多
  #has_many :genres, dependent: :destroy
  #会員１対グループ会員多
  has_many :group_users
  #会員１対グループ多
  has_many :groups, through: :group_users

  #検索機能、部分一致も可能
  def self.search(search)
       if search
          User.where(['name LIKE ?', "%#{search}%"])
       else
          User.all
       end
    end
  end
