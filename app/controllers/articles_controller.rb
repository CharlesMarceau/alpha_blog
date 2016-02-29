class ArticlesController < ApplicationController #du meme coup cherche un dossier "articles" dans "views"
  before_action :set_article, only: [:edit, :update, :show, :destroy] # pour activer la méthode set_article pour seulement ces méthodes la

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5) # @articleS au pluriel
  end

  def new
      @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # debugger
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Articles was successfully deleted"
    redirect_to articles_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end