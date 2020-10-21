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
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'descriptionが空では登録できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'category_idが空では登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください', 'カテゴリーを選択してください')
      end
      it 'category_idが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'status_idが空では登録できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください', '商品の状態を選択してください')
      end
      it 'status_idが1では登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'charge_type_idが空では登録できないこと' do
        @item.charge_type_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください', '配送料の負担を選択してください')
      end
      it 'charge_type_idが1では登録できないこと' do
        @item.charge_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'area_idが空では登録できないこと' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください', '発送元の地域を選択してください')
      end
      it 'area_idが1では登録できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it 'day_to_ship_idが空では登録できないこと' do
        @item.day_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください', '発送までの日数を選択してください')
      end
      it 'day_to_ship_idが1では登録できないこと' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください', '価格は300〜9,999,999の間で入力してください')
      end
      it 'priceが300以下では登録できないこと' do
        @item.price = 123
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300〜9,999,999の間で入力してください')
      end
      it 'priceが9999999以上では登録できないこと' do
        @item.price = 123_456_789
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300〜9,999,999の間で入力してください')
      end
      it 'priceが半角数字以外で入力された場合は登録できないこと' do
        @item.price = '山川'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300〜9,999,999の間で入力してください')
      end
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品画像を入力してください')
      end
    end
  end
end
