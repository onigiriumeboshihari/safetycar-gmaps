require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿機能' do
    context '投稿できるとき' do
      it '全項目入力されると投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '投稿できないとき' do
      it '画像が空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it '道路名が空では登録できない' do
        @post.place = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Place can't be blank")
      end
      it '時間帯が空では登録できない' do
        @post.time = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Time can't be blank")
      end
      it 'もっと詳しくが空では登録できない' do
        @post.more = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("More can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
