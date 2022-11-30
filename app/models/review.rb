class Review < ApplicationRecord
  #serialize :content

  belongs_to :game
  belongs_to :user
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy
end
