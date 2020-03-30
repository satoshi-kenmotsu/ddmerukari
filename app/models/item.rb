class Item < ApplicationRecord
  validates :name, :description, :category, :status, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, presence: true
  validates_associated :images
  validates :images, presence: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_date
end
