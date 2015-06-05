class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "test", password: "test", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to "/articles/#{@article.id}"
    else
      render "/articles/new"
    end
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = article_params[:title]
    @article.text = article_params[:text]
    if @article.save
      redirect_to "/articles/#{@article.id}"
    else
      render "/articles/edit"
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to "/articles"
  end
end
