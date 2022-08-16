class RenameRoomStartEndColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :room_start_end, :room_end_date
  end
end
