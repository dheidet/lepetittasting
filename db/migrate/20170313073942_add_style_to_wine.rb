class AddStyleToWine < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :style, :string
    add_column :wines, :sulfites, :boolean
  end
end
