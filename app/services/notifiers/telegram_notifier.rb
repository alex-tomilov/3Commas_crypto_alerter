class Notifiers::TelegramNotifier
  def initialize(channel) = @channel = channel

  def call(alert, price)
    token = ENV.fetch("TELEGRAM_BOT_TOKEN")
    url = "https://api.telegram.org/bot#{token}/sendMessage"
    message = "Price alert for #{alert.symbol}: the price has reached #{price}"

    response = Faraday.post(url, {
      chat_id: @channel.chat_id,
      text: message
    }.to_json, "Content-Type" => "application/json")

    unless response.success?
      Rails.logger.error "Failed to send Telegram notification: #{response.body}"
    end
  end
end
