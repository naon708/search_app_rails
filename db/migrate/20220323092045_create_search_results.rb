class CreateSearchResults < ActiveRecord::Migration[6.1]
  def change
    create_table :search_results do |t|
      t.string :search_word, null: false
      t.string :video_id, null: false
      t.string :title, null: false
      t.string :description
      t.string :thumbnail, null: false
      t.integer :view_count

      t.timestamps
    end
  end
end
