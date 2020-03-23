# frozen_string_literal: true

class Upstream::Default
  def parse(payload)
    payload
      .require(:opening)
      .permit(:title, :description, :company, :upstream_url, :archived_at, :published_at)
  end
end
