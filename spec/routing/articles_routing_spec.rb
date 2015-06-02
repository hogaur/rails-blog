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
    expect(:get => '/articles/:id/edit').to route_to('articles#edit')
  end

  it 'should route GET /articles/:id to articles#show' do
    expect(:get => '/articles/:id').to route_to('articles#show')
  end

  it 'should route PATCH /articles/:id articles#update' do
    expect(:patch => '/articles/:id').to route_to('articles#update')
  end

  it 'should route PUT /articles/:id articles#update' do
    expect(:put => '/articles/:id').to route_to('articles#update')
  end

  it 'should route DELETE /articles/:id articles#destroy' do
    expect(:delete => '/articles/:id').to route_to('articles#destroy')
  end
end
