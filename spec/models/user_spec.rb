# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be saved' do
    user = Fabricate.build(:user)

    expect(user.save).to be(true)
    expect(user.encrypted_password).to_not be(nil)
  end
end
