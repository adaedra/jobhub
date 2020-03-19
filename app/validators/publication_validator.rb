# frozen_string_literal: true

class PublicationValidator < ActiveModel::Validator
  def validate(record)
    return unless record.archived_at? && record.published_at?
    return unless record.archived_at < record.published_at

    errors.add(:archived_at, 'must be set after publication date')
  end
end
