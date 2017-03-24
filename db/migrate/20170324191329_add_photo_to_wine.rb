class AddPhotoToWine < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :photo, :string
  end
end
