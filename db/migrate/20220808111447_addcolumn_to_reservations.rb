class AddcolumnToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reservation_room_price, :integer
  end
end
