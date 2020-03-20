class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         devise :validatable, password_length: 7..128    
  validates :nickname, :first_name, :first_name_kana, :last_name, :last_name_kana, :birth_year, :birth_month, :birth_day ,presence: true 
  has_one :address
  
end
