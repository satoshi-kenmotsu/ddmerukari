class AddDeliveryDateToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_date, :integer, null: false
  end
end
