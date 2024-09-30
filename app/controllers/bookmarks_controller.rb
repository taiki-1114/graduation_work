class BookmarksController < ApplicationController
  #お気に入りの投稿のブックマークを作成、削除するためのコントローラー
  def create
    @article = Article.find(params[:article_id])
    current_user.bookmark(@article)
  end

  def destroy
    @article = current_user.bookmarks.find(params[:id]).article
    current_user.unbookmark(@article)
  end
end