# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Opening, type: :model do
  describe '#active' do
    before do
      Fabricate(:opening, published_at: nil, archived_at: nil)
      Fabricate(:opening, published_at: 1.month.ago, archived_at: 1.week.ago)
    end

    let!(:active) { Fabricate(:opening) }

    it 'selects only the active offers' do
      expect(Opening.active).to eq([active])
    end
  end
end
