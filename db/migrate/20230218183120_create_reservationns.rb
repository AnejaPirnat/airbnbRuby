class CreateReservationns < ActiveRecord::Migration[7.0]
  def change
    create_table :reservationns do |t|
      t.date :from
      t.date :to
      t.float :totalprice
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
