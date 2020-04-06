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
  has_many :buyed_items, foreign_key: "Buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("Buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("Buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :cards 
  has_many :comments
  has_many :items, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_items, through: :bookmarks, source: :item
  def already_bookmark?(item)
    self.bookmarks.exists?(item_id: item.id)
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_year
  belongs_to_active_hash :birth_month
  belongs_to_active_hash :birth_day

end
