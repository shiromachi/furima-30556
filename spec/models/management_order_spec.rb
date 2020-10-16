require 'rails_helper'

RSpec.describe ManagementOrder, type: :model do
  describe '#create' do
    before do
      @management_order = FactoryBot.build(:management_order)
    end

    context '商品購入に成功したとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@management_order).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @management_order.building = nil
        expect(@management_order).to be_valid
      end
    end

    context '商品購入に失敗したとき' do
      it 'tokenが空では登録できないこと' do
        @management_order.token = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できないこと' do
        @management_order.postal_code = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @management_order.postal_code = 1234567
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'region_idが空では登録できないこと' do
        @management_order.region_id = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idが1では登録できないこと' do
        @management_order.region_id = 1
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Region must be other than 1")
      end
      it 'cityが空では登録できないこと' do
        @management_order.city = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では登録できないこと' do
        @management_order.postal_code = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'phoneが空では登録できないこと' do
        @management_order.phone = nil
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが数字以外では登録できないこと' do
        @management_order.phone = "abcde"
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Phone is invalid. Input half-width characters")
      end
      it 'phoneが11字以上では登録できないこと' do
        @management_order.phone = 123456789123456
        @management_order.valid?
        expect(@management_order.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
    end

  end
end
