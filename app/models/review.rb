class Review < ApplicationRecord
  #serialize :content

  belongs_to :game
  belongs_to :user
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy

  validates :review_title, presence: true, length: {minimum: 5,maximum: 15}
  validates :review_body, presence: true, length: {minimum: 5,maximum: 300}

end
