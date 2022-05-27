class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :official_name, null: false
      t.string :unofficial_name

      t.timestamps
    end
  end
end
