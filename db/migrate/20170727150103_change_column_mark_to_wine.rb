class ChangeColumnMarkToWine < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:wines, :mark, 0)
  end
end
