# Create Pills

Product.destroy_all
User.destroy_all

user = User.create!(
  email: 'user@example.com',
  password: 'password'
)

categories = ['Invisibility', 'Mind-Reading', 'Superhuman Strength', 'Tele-Transportation']
categories.each do |category|
  5.times do
    product = Product.new(
      name: Faker::Lorem.word,
      effect: Faker::Lorem.sentence,
      side_effects: Faker::Lorem.sentence,
      lifespan_days: Faker::Number.between(from: 30, to: 365),
      price: Faker::Number.decimal(l_digits: 2),
      category: category
    )
    product.user = user
    product.save!
  end
end
