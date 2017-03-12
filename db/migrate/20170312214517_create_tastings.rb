class CreateTastings < ActiveRecord::Migration[5.0]
  def change
    create_table :tastings do |t|
      t.string :eye_color
      t.integer :eye_intensity
      t.string :nose_condition
      t.integer :nose_intensity
      t.string :nose_development
      t.integer :nose_quality
      t.integer :palate_sweetness
      t.integer :palate_acidity
      t.integer :palate_tanin
      t.integer :palate_alcohol
      t.integer :palate_body
      t.integer :flavour_intensity
      t.integer :palate_finish
      t.integer :palate_quality
      t.string :readiness
      t.integer :balance
      t.string :description

      t.timestamps
    end
  end
end
