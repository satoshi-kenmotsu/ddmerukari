class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :bland
      t.string :status, null: false
      t.string :delivery_charge, null: false
      t.integer :prefecture_id, null: false
      t.string :delivery_date, null: false
      t.string :price, null: false
      
      t.timestamps
    end
  end
end
