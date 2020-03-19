# frozen_string_literal: true

class Opening < ApplicationRecord
  scope :published, -> { where.not(published_at: nil).where('published_at <= current_timestamp') }
  scope :not_archived, -> { where(archived_at: nil).or(where('archived_at > current_timestamp')) }
  scope :active, -> { published.not_archived }
end
