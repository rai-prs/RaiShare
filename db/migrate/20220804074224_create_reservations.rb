class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :room_start_date
      t.date :room_start_end
      t.integer :room_number

      t.timestamps
    end
  end
end
