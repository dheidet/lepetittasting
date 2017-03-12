class AddPhotoToTasting < ActiveRecord::Migration[5.0]
  def change
    add_column :tastings, :photo, :string
  end
end
