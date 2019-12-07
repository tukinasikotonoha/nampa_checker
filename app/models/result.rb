class Result < ApplicationRecord
  before_create :generate_token

  belongs_to :user
  belongs_to :message
  has_one_attached :image
  validates :user_id, presence: true
  validates :message_id, presence: true
  validate :validate_image
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
  # ファイルの拡張子とファイルサイズのバリデーション
  def validate_image
    return unless image.attached?
    if image.blob.byte_size > 10.megabytes
      # image.purge
      errors.add(:image, 'のファイルサイズは10メガバイト以下でお願いします')
    elsif !image?
      # image.purge
      errors.add(:image, 'の拡張子はjpg/jpeg/gif/pngのみアップロード可能です')
    end
  end
  # 拡張子のバリデーション
  def image?
    %w[image/jpg image/jpeg image/gif image/png].include?(image.blob.content_type)
  end
end
