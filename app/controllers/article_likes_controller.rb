class ArticleLikesController < ApplicationController
  #投稿のいいねの作成、削除を制御するコントローラー
  #投稿のいいねを作成するコントローラー
  def create
    @article = Article.find(params[:article_id])
    current_user.like(@article)

    respond_to do |format|
      format.turbo_stream
      format.html{ redirect_to @article}
    end
  end
#投稿のいいねの削除するコントローラー
  def destroy
    @article = current_user.article_likes.find(params[:id]).article
    current_user.unlike(@article)
  end
end