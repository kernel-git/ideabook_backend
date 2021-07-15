# frozen_string_literal: true

class UsersSeeds
  def perform
    20.times do
      user = User.new(
        email: Faker::Internet.unique.email,
        password: '11111111',
        password_confirmation: '11111111',
      )
      logger.error user.errors.full_messages unless user.save
    end
    user = User.new(
      email: 'test@example.com',
      password: '11111111',
      password_confirmation: '11111111',
    )
    logger.error user.errors.full_messages unless user.save
  end
end
