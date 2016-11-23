#100.times do |index|
  #Customer.create(family_name: "鈴木", given_name: "太郎", email: "customer_#{index}@sparta.com")
#end

# --------------------------下記を追加------------------------
# Config.locale = :jaを指定すると、日本人のような名前が生成される
# Fakerの仕様上、emailを使用する場合、locale = :enを指定しないと、emilの形式に
# 合わないデータが生成されてしまう
100.times do |index|
  Faker::Config.locale = :ja
  family_name = Faker::Name.last_name
  given_name = Faker::Name.first_name

  Faker::Config.locale = :en
  email = Faker::Internet.email

  Customer.create(
    family_name: family_name,
    given_name: given_name,
    email: email
  )
end
# -----------------------------------------------------------