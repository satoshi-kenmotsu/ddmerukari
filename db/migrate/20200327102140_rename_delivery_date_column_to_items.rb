class RenameDeliveryDateColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_date, :delivery_date_id
  end
end
