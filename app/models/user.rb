class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }, presence: true, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :role, presence: true
  # ユーザーが管理者かどうか判定
  enum role: { general: 0, admin: 1 }
  # Twitter認証の関連付け
  has_many :authentications, dependent: :destroy
  # ユーザーは複数の検証結果を持つ
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :authentications
end
