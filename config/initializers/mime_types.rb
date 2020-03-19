# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

Mime::Type.register 'application/vnd.api+json', :jsonapi

# Register jsonapi to be parsed as JSON
ActionDispatch::Request.parameter_parsers[:jsonapi] = lambda do |body|
  JSON.parse(body)
end
