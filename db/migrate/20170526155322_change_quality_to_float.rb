class ChangeQualityToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :tastings, :nose_quality, :float
    change_column :tastings, :palate_quality, :float
    change_column :tastings, :balance, :float
  end
end
