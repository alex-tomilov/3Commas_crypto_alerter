class Alert < ApplicationRecord
  SYMBOLS = %w[BTCUSDT ETHUSDT BNBUSDT]
  enum :side, %w[above below].index_by(&:itself)

  validates :symbol, inclusion: { in: SYMBOLS }
  validates :side, inclusion: { in: sides }
  validates :price,  numericality: { greater_than_or_equal_to: 0.00_000_001 }

  has_many :channel_links, dependent: :destroy
  has_many :email_channels, through: :channel_links, source: :channel, source_type: "EmailChannel"

  def channels = channel_links.includes(:channel).map(&:channel)
end
