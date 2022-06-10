class AddUniqueIndexToCompanyNames < ActiveRecord::Migration[6.1]
  def change
    add_index :companies, :official_name, unique: true
    add_index :companies, :unofficial_name, unique: true
  end
end
