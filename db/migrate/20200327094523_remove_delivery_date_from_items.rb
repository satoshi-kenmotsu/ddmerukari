class RemoveDeliveryDateFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :delivery_date, :string
  end
end
