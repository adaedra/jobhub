# frozen_string_literal: true

class Api::ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :authenticate_upstream_from_token!

  private

  def authenticate_upstream_from_token!
    warden.authenticate! :jwt
  end
end
