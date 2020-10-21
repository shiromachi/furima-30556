require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  it 'textが存在すればコメント投稿できること' do
    expect(@comment).to be_valid
  end

  it 'textが空ではコメント投稿できないこと' do
    @comment.text = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('テキストを入力してください')
  end
end
