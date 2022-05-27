class AddAuthorAndCompanyToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, default: User.where(role: :superadmin).first.id, null: false
    add_reference :articles, :company, default: nil
    add_foreign_key :articles, :users
    add_foreign_key :articles, :companies, default: nil
  end
end
