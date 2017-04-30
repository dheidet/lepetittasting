class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.references :wine, foreign_key: true
      t.integer :contenance
      t.string :competitor
      t.string :link

      t.timestamps
    end
  end
end
