class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension "citext"

    create_table :users do |t|
      t.citext :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
