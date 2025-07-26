class BinanceStreamBtcUsdtJob
  include Sidekiq::Job

  def perform
    EM.run do
      ws = Faye::WebSocket::Client.new("wss://stream.binance.com:9443/ws/btcusdt@ticker")
      ws.on :message do |event|
        price = JSON.parse(event.data)["c"].to_d
        Alert.where(symbol: "BTCUSDT").includes(:channel_links).find_each do |alert|
          triggered = alert.above? ? price >= alert.price : price <= alert.price
          next unless triggered

          alert.channels.each do |channel|
            next unless channel.enabled?

            channel.notifier.call(alert, price)
          end
        end
      end
    end
  end
end
