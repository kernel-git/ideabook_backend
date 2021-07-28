# frozen_string_literal: true

class UsersSeeds
  def perform
    20.times do
      user = generate_user
      logger.error user.errors.full_messages unless user.save
    end
    user = generate_user
    user.email = 'user@example.com'
    user.user!
    logger.error user.errors.full_messages unless user.save
    admin = generate_user
    admin.email = 'admin@example.com'
    admin.admin!
    logger.error admin.errors.full_messages unless admin.save
    superadmin = generate_user
    superadmin.email = 'superadmin@example.com'
    superadmin.superadmin!
    logger.error superadmin.errors.full_messages unless superadmin.save
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
      password_confirmation: '11111111',
      company: Company.find(rand(1..5)),
      role: %w(user admin superadmin).sample
    )
  end
end
