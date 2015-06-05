class CommentsController < ApplicationController

  http_basic_authenticate_with name: "test", password: "test", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
end