class AddBuyerRefToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :Buyer, foreign_key: { to_table: :users }
  end
end
