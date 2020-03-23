class Item < ApplicationRecord
  validates :name, :description, :category, :status, :delivery_charge, :prefecture, :delivery_date, :price, presence: true
end
