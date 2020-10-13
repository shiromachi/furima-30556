require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品に成功したとき' do
      it '全フォーム項目が存在すれば登録できること' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字で入力された場合は登録できること' do
        @item.price = '345'
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '出品に失敗したとき' do
      it 'titleが空では登録できないこと' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では登録できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it 'category_idが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが空では登録できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it 'status_idが1では登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'charge_type_idが空では登録できないこと' do
        @item.charge_type_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge type can't be blank", 'Charge type is not a number')
      end
      it 'charge_type_idが1では登録できないこと' do
        @item.charge_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge type must be other than 1')
      end
      it 'area_idが空では登録できないこと' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end
      it 'area_idが1では登録できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'day_to_ship_idが空では登録できないこと' do
        @item.day_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank", 'Day to ship is not a number')
      end
      it 'day_to_ship_idが1では登録できないこと' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to ship must be other than 1')
      end
      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is out of setting range')
      end
      it 'priceが300以下では登録できないこと' do
        @item.price = 123
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが9999999以上では登録できないこと' do
        @item.price = 123_456_789
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが半角数字以外で入力された場合は登録できないこと' do
        @item.price = '山川'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
