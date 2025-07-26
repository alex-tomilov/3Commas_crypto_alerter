class CreateChannelLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :channel_links do |t|
      t.references :alert, null: false, foreign_key: true
      t.references :channel, polymorphic: true, null: false
      t.timestamps

      t.index [ :alert_id, :channel_type, :channel_id ], unique: true
    end
  end
end
