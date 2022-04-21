class CreateVariations < ActiveRecord::Migration[6.1]
  def change
    create_table :variations do |t|
      t.references :variation_program, null: false, foreign_key: true
      t.string :title, null: false, unique: true
      t.string :japanese_notation, null: false, unique: true
      t.string :universal_notation, null: false, unique: true

      t.timestamps
    end
  end
end
