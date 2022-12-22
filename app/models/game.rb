class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  enum game_model:{
    "PlayStation(1994)":1,
    "PlayStation 2(2000)":2,
    "PlayStation 3(2006)":3,
    "PlayStation 4(2014)":4,
    "PlayStation 5(2020)":5,
    "Xbox(2002)":6,
    "Xbox 360(2005)":7,
    "Xbox One(2014)":8,
    "Xbox Series(2020)":9,
    "Wii":10,
    "Wii U":11,
    "Switch":12,
    "スーパーファミコン(1990)":13
  }

end
