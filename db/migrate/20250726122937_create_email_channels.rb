class CreateEmailChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :email_channels do |t|
      t.boolean :enabled, default: false
      t.string :email_address, null: false
      t.timestamps
    end
  end
end
