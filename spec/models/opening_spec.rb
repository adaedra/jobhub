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

  it 'can save a valid record' do
    record = Fabricate.build(:opening)
    expect(record.save).to be(true)
  end

  it 'validates presence of required fields' do
    record = Fabricate.build(:opening, title: nil, company: nil, description: nil)

    expect(record.save).to be(false)
    expect(record.errors.details[:title]).to include(error: :blank)
    expect(record.errors.details[:company]).to include(error: :blank)
    expect(record.errors.details[:description]).to include(error: :blank)
  end

  describe '#archived_at' do
    it %(can't be set if published_at is unset) do
      record = Fabricate.build(:opening, published_at: nil, archived_at: 1.week.from_now)

      expect(record.save).to be(false)
      expect(record.errors[:published_at]).to include(%(can't be unset if the archival date is set))
    end
  end
end
