class CreateVariationPrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :variation_programs do |t|
      t.string :name, null: false, uniqueness: true

      t.timestamps
    end
  end
end
