class ArticleLikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    current_user.like(@article)

    respond_to do |format|
      format.turbo_stream
      format.html{ redirect_to @article}
    end
  end

  def destroy
    @article = current_user.article_likes.find(params[:id]).article
    current_user.unlike(@article)
  end
end