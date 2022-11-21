class Review < ApplicationRecord
  has_many :games, dependent: :destroy
  #has_many :user, dependent: :destroy
end
