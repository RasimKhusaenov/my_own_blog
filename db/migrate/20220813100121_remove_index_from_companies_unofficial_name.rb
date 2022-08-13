class RemoveIndexFromCompaniesUnofficialName < ActiveRecord::Migration[6.1]
  def change
    remove_index :companies, name: "index_companies_on_unofficial_name"
  end
end
