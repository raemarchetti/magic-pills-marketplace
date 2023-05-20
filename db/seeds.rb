# Create Pills
puts 'Cleaing'

Product.destroy_all
User.destroy_all

puts 'Seed Stared'
avatar_url = [
  "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1684604292~exp=1684604892~hmac=d8007e3646227238100c54942f9dbf2d340475b983113a8a67ce403db0a03acb",
  "https://img.freepik.com/free-psd/3d-illustration-person_23-2149436182.jpg?w=740&t=st=1684605243~exp=1684605843~hmac=607f0fcdaab0923c322f87db8086da006e5cf4c9a448001df286f218c95b4f17",
  "https://img.freepik.com/free-psd/3d-illustration-person-with-long-hair_23-2149436197.jpg?w=740&t=st=1684605298~exp=1684605898~hmac=dbad92655aaf281f27dde4e8a47b5fbf413614ca3e9cd6c96740cf1524b42746",
  "https://img.freepik.com/free-psd/3d-illustration-person-tank-top_23-2149436202.jpg?w=740&t=st=1684605405~exp=1684606005~hmac=e78f460a3e12e233fbc7873ed7c68a228f9359b57716ffb5786eb3a202d9f8da"
]

user_1 = User.create!(
  email: 'user1@example.com',
  password: 'password',
  avatar: avatar_url.sample(1)
)

user_2 = User.create!(
  email: 'user2@example.com',
  password: 'password',
  avatar: avatar_url.sample(1)
)

user_3 = User.create!(
  email: 'user3@example.com',
  password: 'password',
  avatar: avatar_url.sample(1)
)

user_list = [user_1, user_2, user_3]

categories = []

5.times do
  power = Faker::Superhero.power
  categories << { name: power, power: power }
end

categories.each do |category|
  2.times do
    product = Product.new(
      name: "#{Faker::Superhero.name} Pill",
      effect: category[:power],
      side_effects: "#{Faker::Adjective.negative.capitalize} #{Faker::Superhero.descriptor}",
      lifespan_days: Faker::Number.between(from: 30, to: 365),
      price: Faker::Number.decimal(l_digits: 2),
      image: "https://i.imgur.com/xT5azZe.png",
      category: category[:name],
      user: user_list.sample
    )

    product.save!
  end
end
puts 'Seed Finished'
