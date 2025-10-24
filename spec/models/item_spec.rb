require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
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
      end
    end
end
