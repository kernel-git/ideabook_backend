# frozen_string_literal: true

class UsersSeeds
  def perform
    20.times do
      user = generate_user
      user.company = Company.find(rand(1..5))
      logger.error user.errors.full_messages unless user.save
    end
    user = generate_user
    user.company = Company.find(rand(1..5))
    user.email = 'test@example.com'
    logger.error user.errors.full_messages unless user.save
  end

  private

  def generate_user
    User.new(
      email: Faker::Internet.unique.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birth_date: Faker::Date.between(from: 40.years.ago, to: 18.days.ago),
      avatar_url: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
      password: '11111111',
      password_confirmation: '11111111'
    )
  end
end
