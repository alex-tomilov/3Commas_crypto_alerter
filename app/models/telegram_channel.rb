class TelegramChannel < ApplicationRecord
  include Channel

  validates :enabled, inclusion: [ true, false ]
  validates :chat_id, presence: true
  validates :name, presence: true

  has_many :channel_links, as: :channel, dependent: :destroy
  has_many :alerts, through: :channel_links
end
