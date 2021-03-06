# frozen_string_literal: true

class PublicationValidator < ActiveModel::Validator
  def validate(record)
    return unless record.archived_at? && record.published_at?
    return unless record.archived_at < record.published_at

    record.errors.add(:archived_at, :before_publication)
  end
end
