class ArticlesController < ApplicationController
  def index
    render :nothing=>true
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else render :nothing => true
    end
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
