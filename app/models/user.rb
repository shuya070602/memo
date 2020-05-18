class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #会員１対ノート多
  has_many :notes, dependent: :destroy
  #会員１対ジャンル多
  #has_many :genres, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users

def self.search(search)
       if search
          User.where(['name LIKE ?', "%#{search}%"])
       else
          User.all
       end
    end
end
