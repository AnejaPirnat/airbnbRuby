class AddAdressToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :adress, :string
  end
end
