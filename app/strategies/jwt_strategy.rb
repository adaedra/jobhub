# frozen_string_literal: true

class JwtStrategy < Warden::Strategies::Base
  def valid?
    api_token.present?
  end

  def authenticate!
    upstream = Upstream.find(api_token)

    if upstream
      success! upstream
    else
      fail! :no_match
    end
  end

  private

  def api_token
    method, token = env['HTTP_AUTHORIZATION']&.split(/\s+/, 2)
    return nil if method != 'Bearer'

    payload, _header = JWT.decode token, Rails.application.credentials.jwt[:secret], true, algorithm: 'HS256'
    return nil if payload.blank?

    payload['sub']
  rescue JWT::VerificationError
    nil
  end
end
