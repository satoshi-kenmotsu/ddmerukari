class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         devise :validatable, password_length: 7..128    
  validates :nickname, :birth_year, :birth_month, :birth_day ,presence: true 
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, presence: true,
            format: {
              with: /\A[^ -~｡-ﾟ]+\z/,
              message: "全角のみで入力して下さい"
            }
  has_one :address
  
end
