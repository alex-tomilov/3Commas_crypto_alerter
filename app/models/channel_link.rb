class ChannelLink < ApplicationRecord
  belongs_to :alert
  belongs_to :channel, polymorphic: true
end
