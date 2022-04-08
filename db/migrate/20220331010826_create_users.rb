class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :icon

      t.timestamps
    end
    add_index :users, :name, unique: true
  end
end
