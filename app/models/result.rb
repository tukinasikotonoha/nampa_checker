class Result < ApplicationRecord
  belongs_to :user
  belongs_to :message
  has_one_attached :image
  # 検証結果の性別を判定
  enum gender: { male: 0, female: 1 }
end
