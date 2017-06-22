class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :password_digest
      t.string :remember_digest
      t.boolean :gender, default: nil
      t.date :birthday
      t.text :biography
      t.timestamps
    end
    add_index :users, :user_name, unique: true
  end
end
