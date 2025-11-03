require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build_stubbed(:item)
    allow(item).to receive(:image).and_return(ActiveStorage::Blob.new)
    @form_object = FactoryBot.build(:form_object,user_id: user.id, item_id: item.id)
  end

  context '内容に問題がない場合' do
    it '全ての値が正しく入力されていれば購入できる' do
      expect(@form_object).to be_valid
    end

    it 'buildingが空でも購入できる' do
      @form_object.building = ''
      expect(@form_object).to be_valid
    end
  end
  context '購入できないとき' do
      it '郵便番号が空では登録できない' do
        @form_object.postnumber = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postnumber can't be blank")
      end
      it '郵便番号の形式が正しくないと登録できない' do
        @form_object.postnumber = '12345'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postnumber is invalid")
      end
      it '都道府県が---では登録できない' do
        @form_object.prefecture_id = '1'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村区が空では登録できない' do
        @form_object.municipality = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では登録できない' do
        @form_object.street_address = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @form_object.tel = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号の形式が正しくないと登録できない' do
        @form_object.tel = '1234567'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Tel is invalid")
      end
      it "tokenが空では登録できないこと" do
        @form_object.token = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できない' do
        @form_object.user_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @form_object.item_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号が9桁以下では登録できない' do
        @form_object.tel = '090123456'  # 9桁
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Tel is invalid")
      end

      it '電話番号が12桁以上では登録できない' do
        @form_object.tel = '090123456789'  # 12桁
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Tel is invalid")
      end
  end
end