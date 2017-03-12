class AddUsersToTasting < ActiveRecord::Migration[5.0]
  def change
    add_reference :tastings, :user, foreign_key: true, index: true
  end
end
