require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item, :with_image)
  end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'すべての項目を正しく入力すれば登録できる' do
          expect(@item).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nameが空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '画像がないと保存できない' do
          @item.image = nil
          @item.valid?
          expect(@item).to be_invalid
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品の説明が空では登録できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it 'カテゴリーが---では登録できない' do
          @item.category_id = '1'
          @item.valid?

          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態が---では登録できない' do
          @item.status_id = '1'
          @item.valid?

          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it '配送料の負担が---では登録できない' do
          @item.shipping_fee_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end
        it '発送元の地域が---では登録できない' do
          @item.prefecture_id = '1'
          @item.valid?

          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '発送までの日数が---では登録できない' do
          @item.shipping_day_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end
        it '価格が空白では登録できない' do
          @item.price = ""
          @item.valid?

          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格が299以下では登録できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '価格が10000000以上では登録できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it '半角数値以外では登録できない' do
          @item.price = "こんにちは"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'userが紐づいていなければ登録できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
end
