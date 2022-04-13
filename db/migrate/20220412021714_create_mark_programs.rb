class CreateMarkPrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :mark_programs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mark_programs, [:user_id, :program_id], unique: true
  end
end
