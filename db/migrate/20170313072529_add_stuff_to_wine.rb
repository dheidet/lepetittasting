class AddStuffToWine < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :alcohol, :integer
    add_column :wines, :agricultural_mode, :string
    add_column :wines, :available, :boolean
    add_column :wines, :price_cents, :integer
  end
end
