class RenameBirthDayToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :birth_day, :birth_day_id
  end
end
