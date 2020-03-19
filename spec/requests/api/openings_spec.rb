# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Openings', type: :request do
  describe 'POST /api/openings' do
    it 'creates a record with valid data' do
      expect do
        post api_openings_path, params: {
          opening: Fabricate.attributes_for(:opening, upstream_url: 'https://example.org/dummy')
        }
      end
        .to change { Opening.count }.by(1)

      expect(response).to have_http_status(:created)
    end

    it 'requires an upstream url' do
      expect do
        post api_openings_path, params: {
          opening: Fabricate.attributes_for(:opening, upstream_url: nil)
        }
      end
        .to_not(change { Opening.count })

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
