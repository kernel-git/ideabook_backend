# frozen_string_literal: true

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

UsersSeeds.new.perform

puts 'Database populated with seeds'
