class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show;end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit;end

  # POST /articles or /articles.json
  def create
    @article = Article.build(article_params)

      if @article.save
        redirect_to admin_articles_path, notice: "Article was successfully created." 
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
      if @article.update(article_params)
        redirect_to admin_article_path(@article), notice: "Article was successfully updated."
      else
        flash.now[:danger] = '更新に失敗しました'
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article = Article.find(params[:id])
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