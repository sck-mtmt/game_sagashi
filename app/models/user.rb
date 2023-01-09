class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :nick_name, presence: true, length: {minimum: 3,maximum: 10}
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :email, presence: true

  enum gender: { man: 0, woman: 1, unanswered: 2}

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nick_name = "ゲスト"
      user.gender = "unanswered"
      user.birth_date = '2000-01-01'
      user.is_deleted = false
    end
  end
end
