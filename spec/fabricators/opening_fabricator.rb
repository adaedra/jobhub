# frozen_string_literal: true

Fabricator(:opening) do
  title        { Faker::Job.title }
  company      { Faker::Company.name }
  description  { Faker::Company.bs }
  published_at { 1.week.ago }
  archived_at  { 1.month.from_now }
end
