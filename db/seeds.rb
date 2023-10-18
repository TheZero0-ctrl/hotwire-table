60.times do
  Employee.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    department: Employee.departments.keys.sample,
    hire_date: Faker::Date.between(from: 10.years.ago, to: Date.today)
  )
end
