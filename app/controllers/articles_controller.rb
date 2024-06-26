class ArticlesController < ApplicationController
  skip_before_action :require_login

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)

      if @article.save
        redirect_to article_url(@article), notice: "Article was successfully created." 
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @article = current_user.articles.find(params[:id])
      if @article.update(article_params)
        redirect_to article_url(@article), notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy!
      redirect_to articles_url, notice: "Article was successfully destroyed." 
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :question_body)
  end
end
