class RemoveDeliveryChargeFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :delivery_charge, :string
  end
end
