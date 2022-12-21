class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  self.primary_key = "isbn"

end
