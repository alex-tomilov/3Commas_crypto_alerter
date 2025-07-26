class CreateTelegramChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :telegram_channels do |t|
      t.boolean :enabled
      t.string :chat_id
      t.string :name

      t.timestamps
    end
  end
end
