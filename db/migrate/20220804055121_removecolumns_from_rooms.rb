class RemovecolumnsFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :room_start, :date
    remove_column :rooms, :room_end, :date
    remove_column :rooms, :room_number, :integer
  end
end
