class CreateDdmerukariCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :ddmerukari_credentials do |t|
      t.string :provider
      t.string :uid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end