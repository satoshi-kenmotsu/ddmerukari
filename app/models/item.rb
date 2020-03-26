class Item < ApplicationRecord
  validates :name, :description, :category, :status, :delivery_charge, :prefecture, :delivery_date, :price, presence: true
  validates_associated :images
  validates :images, presence: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
