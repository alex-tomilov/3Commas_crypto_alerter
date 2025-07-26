class TelegramChannelsController < ApplicationController
  before_action :set_telegram_channel, only: %i[ show edit update destroy ]

  def index
    @telegram_channels = TelegramChannel.all
  end

  def show
  end

  def new
    @telegram_channel = TelegramChannel.new
  end

  def edit
  end

  def create
    @telegram_channel = TelegramChannel.new(telegram_channel_params)

    if @telegram_channel.save
      redirect_to @telegram_channel, notice: "Telegram channel was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @telegram_channel.update(telegram_channel_params)
      redirect_to @telegram_channel, notice: "Telegram channel was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @telegram_channel.destroy!
    redirect_to telegram_channels_url, notice: "Telegram channel was successfully destroyed."
  end

  private

  def set_telegram_channel
    @telegram_channel = TelegramChannel.find(params[:id])
  end

  def telegram_channel_params
    params.require(:telegram_channel).permit(:name, :chat_id, :enabled)
  end
end
