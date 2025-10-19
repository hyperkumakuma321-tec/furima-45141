require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'bbbbbb'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'kumaiccloud.com'
          @user.valid?
          expect(@user.errors.full_messages).to include ('Email is invalid')
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include ('Password is too short (minimum is 6 characters)')
        end
        it 'パスワードは、半角英数字混合での入力が必須であること' do
          @user.password = 'tanntannmenn'
          @user.password_confirmation = 'tanntannmenn'
          @user.valid?
          expect(@user.errors.full_messages).to include ('Password は英字と数字の両方を含めてください')
        end
        it 'お名前(全角)は、名字と名前がそれぞれ必須であること。(名前)' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name can't be blank")

        end
        it 'お名前(全角)は、名字と名前がそれぞれ必須であること。（名字)' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name can't be blank")

        end
        it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。(名前)' do
          @user.first_name = 'kuma'
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name は全角で入力してください")
        end
        it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。(名字)' do
          @user.last_name = 'kuma'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name は全角で入力してください")
        end
        it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。（名前)' do
          @user.kana_first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Kana first name can't be blank")
        end
        it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。（名字)' do
          @user.kana_last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Kana last name can't be blank")
        end
        it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。(名前)' do
          @user.kana_first_name = 'くま'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Kana first name は全角カナで入力してください")
        end
        it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。（名字）' do
          @user.kana_last_name = 'くま'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Kana last name は全角カナで入力してください")
        end
        it '生年月日が必須であること。' do
          @user.birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Birth can't be blank")
        end
      end
    end
end
