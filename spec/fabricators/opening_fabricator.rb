# frozen_string_literal: true

Fabricator(:opening) do
  title        'Test Dummy'
  company      'Edison'
  description  'You will be put in a car and crashed against a wall'
  published_at { 1.week.ago }
  archived_at  { 1.month.from_now }
end
