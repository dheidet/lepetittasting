class AddWineToTasting < ActiveRecord::Migration[5.0]
  def change
    add_reference :tastings, :wine, foreign_key: true
  end
end
