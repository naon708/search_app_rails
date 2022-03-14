
class CreateDancers < ActiveRecord::Migration[6.1]
  def change
    create_table :dancers do |t|
      t.string :japanese_notation, null: false, unique: true
      t.string :universal_notation, null: false, unique: true
      t.string :russian_notation, unique: true
      t.string :name_order, null: false, unique: true

      t.timestamps
    end
  end
end
