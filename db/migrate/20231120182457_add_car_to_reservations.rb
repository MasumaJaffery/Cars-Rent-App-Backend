class AddCarToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :car, null: false, foreign_key: true
  end
end
