# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(
    email: "a@a",
    password: "booker",
    last_name: "田中", first_name: "青", last_name_kana: "タナカ", first_name_kana: "アオ",
    postal_code: "1111111", address: "東京都文京区1-2-3", telephone_number: "11111111111", is_active: true
)
Customer.create!(
    email: "b@b",
    password: "booker",
    last_name: "西山", first_name: "赤", last_name_kana: "ニシヤマ", first_name_kana: "アカ",
    postal_code: "2222222", address: "東京都新宿区1-2-3", telephone_number: "22222222222", is_active: true
)

Admin.create!(
  email: "f@f",
  password: "booker"
)
Genre.create!(name: "ケーキ")
Genre.create!(name: "ソフトドリンク")
Genre.create!(name: "アルコール")
Genre.create!(name: "紙袋")

# item=Item.create!(
#     genre_id: ,
#     name: "",
#     introduction: "",
#     price: ,
#     is_active: true,
#     image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/.jpeg")), filename: ".jpeg")
# )

Item.create!(
    genre_id: 1,
    name: "ショートケーキ",
    introduction: "イチゴは乗っていません",
    price: 100,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/short_cake.jpeg")), filename: "short_cake.jpeg")
)
    

Item.create!(
    genre_id: 2,
    name: "コカ・コーラ",
    introduction: "1.5L　ゼロではありません。",
    price: 400,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/cocacola.jpeg")), filename: "cocacola.jpeg")
    
)

Item.create!(
    genre_id: 3,
    name: "生ビール",
    introduction: "350mL",
    price: 800,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/nama.jpeg")), filename: "nama.jpeg")
)


Item.create!(
    genre_id: 1,
    name: "黒いケーキ",
    introduction: "くろ",
    price: 500,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/black.png")), filename: "black.png")
)


Item.create!(
    genre_id: 1,
    name: "青いケーキ",
    introduction: "あお",
    price: 500,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/blue.jpeg")), filename: "blue.jpeg")
)

Item.create!(
    genre_id: 1,
    name: "緑のケーキ",
    introduction: "みどり",
    price: 100,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/green.jpeg")), filename: "green.jpeg")
)

Item.create!(
    genre_id: 1,
    name: "ピンクのケーキ",
    introduction: "ぴんく",
    price: 100,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/pink.jpeg")), filename: "pink.jpeg")
)


Item.create!(
    genre_id: 1,
    name: "赤いケーキ",
    introduction: "あか",
    price: 100,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/red.png")), filename: "red.png")
)


Item.create!(
    genre_id: 2,
    name: "水",
    introduction: "water",
    price: 100,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/water.jpeg")), filename: "water.jpeg")
)


Item.create!(
    genre_id: 4,
    name: "袋S",
    introduction: "size S",
    price: 100,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Ssize.jpeg")), filename: "Ssize.jpeg")
)


Item.create!(
    genre_id: 4,
    name: "袋M",
    introduction: "size M",
    price: 200,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Msize.jpeg")), filename: "Msize.jpeg")
)


Item.create!(
    genre_id: 4,
    name: "袋L",
    introduction: "size L",
    price: 300,
    is_active: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/Lsize.jpeg")), filename: "Lsize.jpeg")
)


