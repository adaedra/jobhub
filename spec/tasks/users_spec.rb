# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users' do
  describe 'create' do
    it 'creates an user' do
      expect do
        Rake::Task['users:create'].invoke(Faker::Internet.email)
      end
        .to change(User, :count).by(1).and output(/User \S+ created./).to_stdout
    end
  end
end
