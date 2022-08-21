class RemoveUnofficialNameFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :unofficial_name
  end
end
