class Result < ApplicationRecord
  before_create :generate_token

  belongs_to :user
  belongs_to :message
  has_one_attached :image
  validates :user_id, presence: true
  validates :message_id, presence: true
  # 検証結果の性別を判定
  enum gender: { male: 0, female: 1 }
  # IDをUUID化する
  def generate_token
    self.uuid = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(uuid: random_token)
    end
  end
  # 性別が男性だった場合スコアを修正
  def gender_is_male_change_score
    if self.male?
      self.score = 100 - self.score
    end
  end
end
