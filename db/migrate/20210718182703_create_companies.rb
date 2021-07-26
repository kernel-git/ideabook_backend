# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :avatar_url
      t.string :name
      t.string :slogan
      t.text   :description

      t.timestamps
    end
  end
end
