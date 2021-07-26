# frozen_string_literal: true

class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name
      t.string :last_name
      t.date   :birth_date
      t.string :avatar_url
    end
  end
end
