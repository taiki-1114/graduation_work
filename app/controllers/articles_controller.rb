class ArticlesController < ApplicationController
  skip_before_action :require_login
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = current_user.article.find(params[:id])
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.article.build(article_params)

      if @article.save
        redirect_to article_url(@article), notice: "Article was successfully created." 
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article = current_user.article.find(params[:id])
      if @article.update(article_params)
        redirect_to article_url(@article), notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article = current_user.article.find(params[:id])
    @article.destroy!
      redirect_to articles_url, notice: "Article was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :question_body, :question_answer)
    end
end
