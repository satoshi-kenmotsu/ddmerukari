class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_number, :prefecture, :city, :house_number, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :birth_year
  belongs_to_active_hash :birth_month
  belongs_to_active_hash :birth_day
end
