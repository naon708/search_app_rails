class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :dancers, :japanese_notation, true
  end

  def down
    change_column_null :dancers, :japanese_notation, false
  end
end
