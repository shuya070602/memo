class Genre < ApplicationRecord
  #会員１対ジャンル多
  belongs_to :user
  #ジャンル１対ノート多
  has_many :notes

  #ジャンルの空白禁止
  validates :name, presence: true
end
