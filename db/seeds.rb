if Rails.env.development?
  AdminUser.delete_all
  User.delete_all

  User.create(
    email: 'user@example.com',
    password: '12345678',
    first_name: 'Example',
    last_name: 'User'
  )
  5.times do
    User.create(
      email: Faker::Internet.email,
      password: '12345678',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  end

  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end
