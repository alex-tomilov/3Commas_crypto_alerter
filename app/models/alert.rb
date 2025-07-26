class Alert < ApplicationRecord
  SYMBOLS = %w[BTCUSDT ETHUSDT BNBUSDT]
  enum :side, %w[above below].index_by(&:itself)

  validates :symbol, inclusion: { in: SYMBOLS }
  validates :side, inclusion: { in: sides }
  validates :price,  numericality: { greater_than_or_equal_to: 0.00_000_001 }
end
