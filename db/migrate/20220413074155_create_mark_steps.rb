class CreateMarkSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :mark_steps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :step, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mark_steps, [:user_id, :step_id], unique: true
  end
end
