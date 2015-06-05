require 'rails_helper'

describe CommentsController do
  describe 'comments#create' do
    it 'should create a comment on a particular article' do
      article = Article.create(title: "title", text: "text")
      post :create, article_id:article.id, comment:{commenter: "H", body:"another comment"}
      expect(Comment.count).to eq(1)
      expect(assigns(:comment).commenter).to eq("H")
      expect(assigns(:comment).body).to eq("another comment")
      expect(assigns(:comment).article).to eq(Article.find(article.id))
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/articles/#{article.id}")
    end
  end

  describe 'comments#destroy' do
    it 'should delete a particular comment if authenticated' do
      article = Article.create(title:"title", text:"text")
      comment = article.comments.create(commenter: "h", body: "b")
      expect(article.comments.count).to eq(1)
      admin_login
      delete :destroy, id:comment.id, article_id:article.id
      expect(article.comments.count).to eq(0)
      expect(response.status).to eq(302)
      expect(response).to redirect_to(article_path(article))
    end

    it 'should not delete a comment if not authenticated' do
      article = Article.create(title:"title", text:"text")
      comment = article.comments.create(commenter: "h", body: "b")
      expect(article.comments.count).to eq(1)
      delete :destroy, id:comment.id, article_id:article.id
      expect(article.comments.count).to eq(1)
      expect(response.status).to eq(401)
    end
  end
end
