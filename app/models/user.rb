class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true, length: { maximum: 255 }
  validates :role, presence: true
  # ユーザーが管理者かどうか判定
  enum role: { general: 0, admin: 1 }
end