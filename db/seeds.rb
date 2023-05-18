# Create Pills

Product.destroy_all
User.destroy_all

user = User.create!(
  email: 'user@example.com',
  password: 'password'
)

categories = []

5.times do
  power = Faker::Superhero.power
  categories << { name: power, power: power }
end

categories.each do |category|
  5.times do
    product = Product.new(
      name: "#{Faker::Superhero.name} Pill",
      effect: category[:power],
      side_effects: "#{Faker::Adjective.negative.capitalize} #{Faker::Superhero.descriptor}",
      lifespan_days: Faker::Number.between(from: 30, to: 365),
      price: Faker::Number.decimal(l_digits: 2),
      category: category[:name]
    )
    product.user = user
    product.save!
  end
end
