# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Admin.create!(
  id: 1,
  email: 'aa@gmail.com',
  password: 'admin1',
  )

Item.create!(
      id: 1,
      name: 'ショートケーキ',
      introduction: 'うまいよ',
      genre_id: 1,
      non_taxed_price: '1200',
      is_valid: true,
      item_image_id: open('./app/assets/images/no_image.jpg')
            )

Genre.create!(
      id: 1,
      name: 'ケーキ',
      is_valid: true,
            )
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
