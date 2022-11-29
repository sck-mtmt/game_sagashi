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

end
