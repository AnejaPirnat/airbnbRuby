class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
