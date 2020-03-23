# frozen_string_literal: true

class AddUpstreamModuleToUpstream < ActiveRecord::Migration[6.0]
  def change
    add_column :upstreams, :upstream_module, :string
  end
end
