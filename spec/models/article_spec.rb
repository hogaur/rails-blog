require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should not save a model with no title' do
    article = Article.new(text:"text")
    expect(article.save).to eq(false)
  end

  it 'shoudl not save a model if title length is less than 5' do
    article = Article.new(title:"sh", text: "short title")
    expect(article.save).to eq(false)
  end
end
