class Item < ApplicationRecord
  validates :name, :description, :category, :status, :delivery_charge, :prefecture, :delivery_date, :price, presence: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
