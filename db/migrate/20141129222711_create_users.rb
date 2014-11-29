class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :company_id, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :company_id
  end
end
