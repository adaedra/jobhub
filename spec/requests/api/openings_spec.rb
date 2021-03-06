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
        .not_to change(Opening, :count)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'creates a record with valid data' do
      expect do
        post api_openings_path, params: {
          opening: Fabricate.attributes_for(:opening, upstream_url: 'https://example.org/dummy')
        }.to_json, headers: headers
      end
        .to change(Opening, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    it 'requires an upstream url' do
      expect do
        post api_openings_path, params: {
          opening: Fabricate.attributes_for(:opening, upstream_url: nil)
        }.to_json, headers: headers
      end
        .not_to change(Opening, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end

    context 'when using the GoHiring module' do
      let(:upstream) { Fabricate(:upstream, upstream_module: 'go_hiring') }

      it 'parses the request correctly' do
        expect do
          data = file_fixture('go_hiring/publication.json')
          post api_openings_path, params: data.read, headers: headers
        end
          .to change(Opening, :count).by(1)

        expect(response).to have_http_status(:success)

        opening = Opening.last
        expect(opening.title).to eq('Teamassistenten (m/w) für Marketing und Vertrieb')
        expect(opening.company).to eq('Songstar UG')
        expect(opening.upstream_url).to eq('https://example.org/gh/7029a72f-717c-48bc-b25d-608ce9222312')
      end
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
