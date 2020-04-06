class Item < ApplicationRecord
  validates :name, :description, :category_id, :status, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, presence: true
  validates_associated :images
  validates :images, presence: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  #belongs_to :seller, class_name: "User"
  #belongs_to :Buyer, class_name: "User"
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_date
  has_many :comments, dependent: :destroy
end
