class CreateMarkDancers < ActiveRecord::Migration[6.1]
  def change
    create_table :mark_dancers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dancer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mark_dancers, [:user_id, :dancer_id], unique: true
  end
end
