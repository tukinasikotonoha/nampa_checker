class Result < ApplicationRecord
  # 定数を定義
  MAXIMUM_SCORE = 100
  MAXIMUM_SCORE.freeze

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
  def reverse_score
    self.score = MAXIMUM_SCORE - score
  end

  # scoreに値に応じてメッセージを付与
  def add_message
    self.message_id = Message.where(maximum: score..Float::INFINITY).order('maximum desc').last.id
  end

  # ファイルの拡張子とファイルサイズのバリデーション
  def validate_image
    return unless image.attached?

    if image.blob.byte_size > 10.megabytes
      errors.add(:image, 'のファイルサイズは10MB以下でお願いします')
    elsif !content_type_image?
      errors.add(:image, 'の拡張子はjpg/jpeg/gif/pngのみアップロード可能です')
    end
  end

  # 拡張子のバリデーション
  def content_type_image?
    %w[image/jpg image/jpeg image/gif image/png].include?(image.blob.content_type)
  end

  # 顔認証API
  def return_gender_rate
    credentials = Aws::Credentials.new(Rails.application.credentials.aws_access_key_id, Rails.application.credentials.aws_secret_access_key)
    Aws.config.update(region: 'ap-northeast-1')
    client = Aws::Rekognition::Client.new credentials: credentials
    # photo = self.image.blob.filename.to_s
    # path = File.expand_path(photo) # expand path relative to the current directory
    # file = File.read(path)
    attrs = {
      image: { bytes: image.download },
      attributes: ['ALL']
    }
    response = client.detect_faces attrs
    # puts "Detected faces for: #{photo}"
    return if response.face_details.blank?

    self.gender = response.face_details.first[:gender][:value].downcase
    self.score = response.face_details.first[:gender][:confidence]
  end
end
