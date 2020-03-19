# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Upstream, type: :model do
  it 'can save the model' do
    upstream = Fabricate.build(:upstream)

    expect(upstream.save).to be(true)
  end
end
