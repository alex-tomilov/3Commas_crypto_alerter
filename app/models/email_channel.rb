class EmailChannel < ApplicationRecord
  include Channel

  validates :enabled, inclusion: [ true, false ]
  validates :email_address, presence: true

  has_many :channel_links, as: :channel, dependent: :destroy
  has_many :alerts, through: :channel_links
end
