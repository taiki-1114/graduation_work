class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  
  #記事との関連付け
  has_many :articles, dependent: :destroy

  #ブックマーク機能の関連付け
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_articles, through: :bookmarks, source: :article
  
  #いいね機能の関連付け
  has_many :article_likes, dependent: :destroy
  has_many :liked_articles, through: :article_likes, source: :article

  #一般ユーザーと管理者ユーザーの分類
  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object&.user_id
  end
  
  #ブックマークを追加するメソッド
  def bookmark(article)
    bookmark_articles << article
  end

  #ブックマークを削除するメソッド
  def unbookmark(article)
    bookmark_articles.destroy(article)
  end

  #すでにブックマークしているか確認するメソッド
  def bookmark?(article)
    bookmark_articles.include?(article)
  end

  #いいねを追加する機能
  def like(article)
    liked_articles << article
  end

  #いいねを削除する機能
  def unlike(article)
    liked_articles.destroy(article)
  end 

  #いいねがすでにされていないか確認する機能
  def liked?(article)
    liked_articles.include?(article)
  end

end
