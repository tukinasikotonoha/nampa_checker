class Result < ApplicationRecord
  before_create :generate_token

  belongs_to :user
  belongs_to :message
  has_one_attached :image
  # 検証結果の性別を判定
  enum gender: { male: 0, female: 1 }
  # IDをUUID化する
  def generate_token
    self.id = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(id: random_token)
    end
  end
end
