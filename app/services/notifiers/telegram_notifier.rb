class Notifiers::TelegramNotifier
  def initialize(channel) = @channel = channel

  def call(alert, price)
    # TODO: Implement telegram notification logic
    Rails.logger.info "Sending telegram notification to #{@channel.chat_id} for #{alert.symbol} at #{price}"
  end
end
