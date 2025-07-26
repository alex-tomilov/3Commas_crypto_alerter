class CreateAlerts < ActiveRecord::Migration[8.0]
  def change
    create_table :alerts do |t|
      t.string :symbol, null: false
      t.string :side, null: false
      t.decimal :price, null: false, precision: 20, scale: 8
      t.timestamps
    end
  end
end
