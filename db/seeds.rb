# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { name1: '容量' },
  { name2: '機種' },
  { name3: '価格' },
  { name4: 'BGM' },
  { name5: 'レビューが好評' },
  { name6: '雰囲気が良さそう' }
])
Admin.create!(
  email: 'admin@admin.com',
  password: 'aiueoaiueo',
)