# frozen_string_literal: true

class CompaniesSeeds
  def perform
    5.times do
      company = generate_company
      logger.error company.errors.full_messages unless company.save
    end
  end

  private

  def generate_company
    Company.new(
      name: Faker::Company.name,
      slogan: Faker::Lorem.sentence,
      avatar_url: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
      description: Faker::Lorem.paragraph(sentence_count: 1..3)
    )
  end
end
