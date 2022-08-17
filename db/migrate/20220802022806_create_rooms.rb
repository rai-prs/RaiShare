class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.text :room_introduction
      t.integer :room_price
      t.string :room_address
      t.string :room_image
      t.date :room_start
      t.date :room_end
      t.integer :room_number

      t.timestamps
    end
  end
end
