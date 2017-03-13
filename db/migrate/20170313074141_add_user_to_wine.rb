class AddUserToWine < ActiveRecord::Migration[5.0]
  def change
    add_reference :wines, :user, foreign_key: true
  end
end
