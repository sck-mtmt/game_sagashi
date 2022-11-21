class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :games, dependent: :destroy
  #belongs_to :review
  enum gender: { man: 0, woman: 1, unanswered: 2}
end
