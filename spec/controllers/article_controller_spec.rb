require 'rails_helper'

describe ArticlesController, type: :controller do
  describe 'articles#index' do
    it 'should return all the articles' do
      get :index
      expect(response.status).to eq(200)
      expect(assigns(:articles).count).to eq(Article.count)
    end
  end

  describe 'GET articles#new' do
    subject {get :new}
    it 'should render articles/new template' do
      get :new
      expect(assigns(:article).id).to eq(nil)
      expect(response.status).to eq(200)
      expect(response).to render_template("articles/new")
      expect(subject).to render_template("articles/new")
    end
  end

  describe 'articles#create' do
    it 'should create a new article and redirect to articles/:id' do
      post :create, :article => {:title => "newport", :text => "article"}
      expect(response.status).to eq(302)
      expect(assigns(:article).title).to eq("newport")
      expect(assigns(:article).text).to eq("article")
      expect(response).to redirect_to("/articles/#{assigns(:article).id}")
    end

    it 'should render new when Article model does not validate' do
      post :create, :article =>{:title => "new", :text => "port"}
      expect(assigns(:article).save).to eq(false)
      expect(response.status).to eq(200)
      expect(assigns(:article).title).to eq("new")
      expect(assigns(:article).text).to eq("port")
      expect(response).to render_template("articles/new")
    end
  end

  describe 'articles#show' do
    it 'should render the correct article' do
      article = Article.create(title:"title",text: "text")
      get :show, :id => article.id
      expect(response.status).to eq(200)
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'articles#edit' do
    it 'should open the article with given id for editing and update it' do
      article = Article.create(title:"editme", text:"edit text")
      get :edit, id: article.id
      expect(response.status).to eq(200)
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'articles#update' do
    it 'should update the given article' do
      article = Article.create(title: "edit me", text: "edit text")
      patch :update, id:article.id, :article => {title: "edited", text: "edited text"}
      expect(assigns(:article).id).to eq(article.id)
      expect(assigns(:article).title).to eq("edited")
      expect(assigns(:article).text).to eq("edited text")
      expect(response.status).to eq(302)
      expect(response).to redirect_to("articles/#{article.id}")
    end

    it 'should render edit if Article model does not validate' do
      article = Article.create(title: "edit me", text: "edit text")
      patch :update, id:article.id, :article => {title: "edit", text: "edited text"}
      expect(assigns(:article).save).to eq(false)
      expect(assigns(:article).id).to eq(article.id)
      expect(assigns(:article).title).to eq("edit")
      expect(assigns(:article).text).to eq("edited text")
      expect(response.status).to eq(200)
      expect(response).to render_template("articles/edit")
    end
  end
end
