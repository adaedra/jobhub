# frozen_string_literal: true

class AddUpstreamUrlToOpening < ActiveRecord::Migration[6.0]
  def change
    add_column :openings, :upstream_url, :string
  end
end
