class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :question_body, presence: true, length: { maximum: 535 }
  validates :question_answer, length: { maximum: 535 }

  #ユーザーとの関連付け
  belongs_to :user

  #ブックマーク機能との関連付け
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  #いいね機能との関連付け
  has_many :article_likes, dependent: :destroy
  has_many :like_by_users, through: :article_likes, source: :user
end
