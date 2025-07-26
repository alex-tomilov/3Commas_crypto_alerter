class AlertMailer < ApplicationMailer
  def threshold_email(alert:, price:, to:)
    @alert = alert
    @price = price
    mail(to: to, subject: "Price alert for #{@alert.symbol}")
  end
end
