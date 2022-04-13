class CreateMarkVariations < ActiveRecord::Migration[6.1]
  def change
    create_table :mark_variations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :variation, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mark_variations, [:user_id, :variation_id], unique: true
  end
end
