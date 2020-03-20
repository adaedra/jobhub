# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Openings', type: :request do
  describe 'POST /api/openings' do
    let(:upstream) { Fabricate(:upstream) }

    it 'requires authentication' do
      expect do
        post \
          api_openings_path,
          params: { opening: Fabricate.attributes_for(:opening) }.to_json,
          headers: headers.tap { |headers| headers.delete('Authorization') }
      end
        .to_not(change { Opening.count })

      expect(response).to have_http_status(:unauthorized)
    end

    it 'creates a record with valid data' do
      expect do
        post api_openings_path, params: {
          opening: Fabricate.attributes_for(:opening, upstream_url: 'https://example.org/dummy')
        }.to_json, headers: headers
      end
        .to change { Opening.count }.by(1)

      expect(response).to have_http_status(:created)
    end

    it 'requires an upstream url' do
      expect do
        post api_openings_path, params: {
          opening: Fabricate.attributes_for(:opening, upstream_url: nil)
        }.to_json, headers: headers
      end
        .to_not(change { Opening.count })

      expect(response).to have_http_status(:unprocessable_entity)
    end

    private

    def headers
      token = JWT.encode({ sub: upstream.id }, Rails.application.credentials.jwt[:secret], 'HS256')

      {
        'Content-Type' => 'application/vnd.api+json',
        'Authorization' => "Bearer #{token}"
      }
    end
  end
end
