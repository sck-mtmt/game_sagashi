class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy

  enum gender: { man: 0, woman: 1, unanswered: 2}

  def active_for_authentication?
    super && (is_deleted == false)
  end
  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nick_name = "gest"
      user.birth_date = '2000-01-01'
      user.is_deleted = false
    end
  end
end
