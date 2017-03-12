class AddUsertoEstate < ActiveRecord::Migration[5.0]
  def change
    add_reference :estates, :user, foreign_key: true, index: true
  end
end
