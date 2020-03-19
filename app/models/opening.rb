# frozen_string_literal: true

class Opening < ApplicationRecord
  validates :title, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :published_at, presence: { message: %(can't be unset if the archival date is set) }, if: :archived_at?
  validates :upstream_url, url: { allow_nil: true, schemes: %i[https] }
  validates_with PublicationValidator

  scope :published, -> { where.not(published_at: nil).where('published_at <= current_timestamp') }
  scope :not_archived, -> { where(archived_at: nil).or(where('archived_at > current_timestamp')) }
  scope :active, -> { published.not_archived }
end
