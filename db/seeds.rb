# Create Pills

Product.destroy_all
User.destroy_all

user = User.create!(
  email: 'user@example.com',
  password: 'password'
)

pills = [
  { name: 'Pill A', effect: 'Effect A', side_effects: 'Side Effect A', lifespan_days: 30, price: 9.99, user_id: 3 },
  { name: 'Pill B', effect: 'Effect B', side_effects: 'Side Effect B', lifespan_days: 60, price: 19.99, user_id: 3 },
  { name: 'Pill C', effect: 'Effect C', side_effects: 'Side Effect C', lifespan_days: 90, price: 29.99, user_id: 3 },
  # Add more pills as needed
]

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
      category: category,
      user_id: user.id
    )
    product.user = user
    product.save!
  end
end
