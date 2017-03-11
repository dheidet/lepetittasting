class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.references :estate
      t.string :name
      t.string :label
      t.date :vintage
      t.string :grape_variety
      t.string :color
      t.integer :mark
      t.string :description

      t.timestamps
    end
  end
end
