class CreateEstates < ActiveRecord::Migration[5.0]
  def change
    create_table :estates do |t|
      t.string :name
      t.string :mark
      t.string :description

      t.timestamps
    end
  end
end
