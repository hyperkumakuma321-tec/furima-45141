class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は全角で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は全角で入力してください" }
  validates :kana_last_name,  presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カナで入力してください" }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カナで入力してください" }

  validates :nickname, presence: true
  validates :birth,    presence: true

end
