class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :bland
      t.integer :status, null: false
      t.integer :delivery_charge, null: false
      t.integer :prefecture, null: false
      t.integer :delivery_date, null: false
      t.integer :price, null: false
      
      t.timestamps
    end
  end
end
