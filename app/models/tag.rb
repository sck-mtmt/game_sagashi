class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :reviews, through: :tag_maps, dependent: :destroy

end
