class RemovePrefectureFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :prefecture, :integer
  end
end
