class Alert < ApplicationRecord
  enum :side, %w[above below].index_by(&:itself)

  validates :symbol, inclusion: { in: %w[BTCUSDT ETHUSDT BNBUSDT] }
  validates :price,  numericality: { greater_than: 0 }
end
