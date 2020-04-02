require 'rails_helper'

describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # it "is invalid without a category_id" do
    #   item = build(:item, category_id: "")
    #   item.valid?
    #   expect(item.errors[:category_id]).to include("can't be blank")
    # end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_date_id" do
      item = build(:item, delivery_date_id: "")
      item.valid?
      expect(item.errors[:delivery_date_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_date_id" do
      item = build(:item, delivery_charge_id: "")
      item.valid?
      expect(item.errors[:delivery_charge_id]).to include("can't be blank")
    end
  end
end
