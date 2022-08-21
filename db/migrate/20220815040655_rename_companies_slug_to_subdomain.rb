class RenameCompaniesSlugToSubdomain < ActiveRecord::Migration[6.1]
  def change
    rename_column :companies, :slug, :subdomain
  end
end
