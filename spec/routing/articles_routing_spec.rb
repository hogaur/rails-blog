require "rails_helper"

describe 'Articles routes' do
  it 'should route GET /articles to articles#index' do
    expect(:get => '/articles').to route_to('articles#index')
  end

  it 'should route POST /articles to articles#create' do
    expect(:post => '/articles').to route_to('articles#create')
  end

  it 'should route GET /articles/new to articles#new' do
    expect(:get => '/articles/new').to route_to('articles#new')
  end

  it 'should route GET /articles/:id/edit articles#edit' do
    expect(:get => '/articles/1/edit').to route_to('articles#edit',{id: "1"})
  end

  it 'should route GET /articles/:id to articles#show' do
    expect(:get => '/articles/1').to route_to('articles#show', {id:"1"})
  end

  it 'should route PATCH /articles/:id articles#update' do
    expect(:patch => '/articles/1').to route_to('articles#update', {id: "1"})
  end

  it 'should route PUT /articles/:id articles#update' do
    expect(:put => '/articles/1').to route_to('articles#update', {id: "1"})
  end

  it 'should route DELETE /articles/:id articles#destroy' do
    expect(:delete => '/articles/1').to route_to('articles#destroy', {id: "1"})
  end
end
