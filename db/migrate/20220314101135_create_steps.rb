class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :japanese_notation, null: false, unique: true
      t.string :universal_notation, null: false, unique: true

      t.timestamps
    end
  end
end
