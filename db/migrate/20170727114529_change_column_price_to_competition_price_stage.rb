class ChangeColumnPriceToCompetitionPriceStage < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:competition_price_stages, :wine_price, 0)
    change_column_default(:competition_price_stages, :transport_price, 0)
  end
end
