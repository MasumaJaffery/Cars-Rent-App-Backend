class RemoveCarAndItemFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reservations, :car, foreign_key: true
  end
end
