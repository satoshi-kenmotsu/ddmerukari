class AddDeliveryChargeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_charge, :integer, null: false
  end
end
