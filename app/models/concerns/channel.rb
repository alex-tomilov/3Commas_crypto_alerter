module Channel
  extend ActiveSupport::Concern

  included { scope :enabled, -> { where(enabled: true) } }

  def notifier
    "Notifiers::#{self.class.name.delete_suffix('Channel')}Notifier".constantize.new(self)
  end
end
