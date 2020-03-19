# frozen_string_literal: true

# A human user of the application. These are the site administrators, who have access to the whole interface to create
# and edit offers.
class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :trackable
end
