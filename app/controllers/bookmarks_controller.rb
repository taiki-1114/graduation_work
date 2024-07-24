class BookmarksController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      current_user.bookmark(@article)
    end
  
    def destroy
      @article = current_user.bookmarks.find(params[:id]).article
      current_user.unbookmark(@article)
    end
  end