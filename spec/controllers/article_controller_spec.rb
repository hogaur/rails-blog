require 'rails_helper'

describe ArticlesController, type: :controller do
  describe 'articles#index' do
    it 'should be present' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET articles#new' do
    subject {get :new}
    it 'should render articles/new template' do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template("articles/new")
      expect(subject).to render_template("articles/new")
    end
  end

  describe 'article#create' do
    it 'should create a new article and redirect to articles/:id' do
      post :create, :article => {:title => "new", :text => "article"}
      expect(response.status).to eq(302)
      expect(assigns(:article).title).to eq("new")
      expect(assigns(:article).text).to eq("article")
      expect(response).to redirect_to("/articles/#{assigns(:article).id}")
    end
  end
end