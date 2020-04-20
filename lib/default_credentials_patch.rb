# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/rails/credentials/credentials_generator'

class CustomCredetialsGenerator < Rails::Generators::CredentialsGenerator
  def credentials_template
    {
      secret_key_base: SecureRandom.hex(64),
      devise: {
        secret_key: SecureRandom.hex(64),
        pepper: SecureRandom.hex(64)
      },
      jwt: {
        secret: SecureRandom.hex(64)
      }
    }.deep_stringify_keys.to_yaml
  end
end

module DefaultCredentialsPatch
  def credentials_generator
    CustomCredetialsGenerator.new
  end
end

Rails::Command::CredentialsCommand.class_eval do
  prepend DefaultCredentialsPatch
end
