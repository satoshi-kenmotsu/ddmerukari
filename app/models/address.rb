class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_number, :prefecture, :city, :house_number, presence: true
end
