class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable   
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
  has_many :ddmerukari_credentials
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_year
  belongs_to_active_hash :birth_month
  belongs_to_active_hash :birth_day
  
  def self.from_omniauth(auth)
    sns = DdmerukariCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
