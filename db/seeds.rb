# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { name: '容量' },
  { name: '機種' },
  { name: '価格' },
  { name: 'BGM' },
  { name: 'レビューが好評' },
  { name: '雰囲気が良さそう' }
])
Admin.create!(
  email: 'admin@admin.com',
  password: 'aiueoaiueo',
)