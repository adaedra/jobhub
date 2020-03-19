# frozen_string_literal: true

namespace :users do
  desc 'Manually create an user in database'
  task :create, %i[email] => :environment do |_, args|
    if args[:email].blank?
      puts %(Usage: bin/rails 'users:create[user@example.org]')
      next
    end

    email = args[:email]
    password = SecureRandom.base64(12)
    User.create! email: email, password: password

    puts "User #{email} created."
    puts "Use this password to connect: #{password}"
  end
end
