class AddPostToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :post, null: false, foreign_key: true
  end
end
