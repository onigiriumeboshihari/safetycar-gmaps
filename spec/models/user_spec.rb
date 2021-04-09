require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録テスト' do
    context 'ユーザー新規登録できるとき' do
      it '全項目入力すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ユーザー名が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'よく運転する時間帯が空では登録できない' do
        @user.time = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Time can't be blank")
      end
      it 'よく運転する道路名が空では登録できない' do
        @user.place = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Place can't be blank")
      end
      it 'プロフィールが空では登録できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードを入力してもパスワード確認が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード確認が一致しないと登録できない' do
        @user.password = '2222hoge'
        @user.password_confirmation = '3333hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'メールアドレスが@なしでは登録できない' do
        @user.email = 'testpass'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end