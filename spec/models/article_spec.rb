require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should not save a model with no title' do
    article = Article.new(text:"text")
    expect(article.save).to eq(false)
    expect(Article.count).to eq(0)
  end

  it 'shoudl not save a model if title length is less than 5' do
    article = Article.new(title:"sh", text: "short title")
    expect(article.save).to eq(false)
    expect(Article.count).to eq(0)
  end

  it 'can have many comments' do
    article = Article.create(title: "another", text: "article")
    comment1 = article.comments.create(commenter: "Hari", body: "Keep going")
    comment2 = article.comments.create(commenter: "Deba", body: "Keep going bro")
    expect(article.reload.comments).to eq([comment1, comment2])
  end

  it 'should delete associated comments when an article is deleted' do
    article = Article.create(title: "title", text: "text")
    article.comments.create(commenter: "c", body: "b")
    article.comments.create(commenter: "a", body: "b")
    article.destroy
    expect(Comment.count).to eq(0)
  end
end
