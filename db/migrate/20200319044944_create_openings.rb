# frozen_string_literal: true

class CreateOpenings < ActiveRecord::Migration[6.0]
  def change
    create_table :openings do |t|
      t.string :title, null: false
      t.string :company, null: false
      t.text :description, null: false
      t.datetime :published_at
      t.datetime :archived_at

      t.timestamps
    end
  end
end
