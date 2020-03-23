# frozen_string_literal: true

class Upstream::GoHiring < Upstream::Default
  BASE_URI = URI.parse('https://example.org/gh/')

  def parse(payload)
    values = params_from(payload)

    values[:title] = values.delete('PositionTitle')
    values[:company] = values.delete('OrganizationName')
    values[:upstream_url] = URI.join(BASE_URI, values.delete('PositionID'))
    values[:description] =
      values
      .delete('PositionFormattedDescription')
      .map { |entry| "# #{entry['Label']}\n\n#{entry['Content']}" }
      .join("\n\n")
    values
  end

  private

  def params_from(payload)
    root = payload.require(:data).require(:attributes)
    root.permit(
      'PositionTitle',
      'OrganizationName',
      'PositionID',
      'PositionFormattedDescription' => %w[Label Content]
    )
  end
end
