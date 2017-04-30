class CreateCompetitionPriceStages < ActiveRecord::Migration[5.0]
  def change
    create_table :competition_price_stages do |t|
      t.float :wine_price
      t.float :transport_price
      t.integer :conditionning
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
