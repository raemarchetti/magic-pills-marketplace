# Create Pills
puts 'Seeds: Started!'

pills = [
  { name: 'Pill A', effect: 'Effect A', side_effects: 'Side Effect A', lifespan_days: 30, price: 9.99 },
  { name: 'Pill B', effect: 'Effect B', side_effects: 'Side Effect B', lifespan_days: 60, price: 19.99 },
  { name: 'Pill C', effect: 'Effect C', side_effects: 'Side Effect C', lifespan_days: 90, price: 29.99 },
  # Add more pills as needed
]

# Loop through the pills array and create Pill records
pills.each do |pill|
  Product.create!(pill)
  puts "Created #{pill.name}"
end
puts 'Seeds: Ended!'

# comment
