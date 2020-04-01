class RenameBirthMonthColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :birth_month, :birth_month_id
  end
end
