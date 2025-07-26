class Notifiers::EmailNotifier
  def initialize(channel) = @channel = channel

  def call(alert, price)
    AlertMailer.threshold_email(alert:, price:, to: @channel.email_address).deliver_later
  end
end
