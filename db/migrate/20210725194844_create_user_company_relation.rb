class CreateUserCompanyRelation < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.belongs_to :company
    end
  end
end
