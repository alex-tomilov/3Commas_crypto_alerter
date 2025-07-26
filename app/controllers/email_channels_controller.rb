class EmailChannelsController < ApplicationController
  before_action :set_email_channel, only: %i[ show edit update destroy ]

  # GET /email_channels or /email_channels.json
  def index
    @email_channels = EmailChannel.all
  end

  # GET /email_channels/1 or /email_channels/1.json
  def show
  end

  # GET /email_channels/new
  def new
    @email_channel = EmailChannel.new
  end

  # GET /email_channels/1/edit
  def edit
  end

  # POST /email_channels or /email_channels.json
  def create
    @email_channel = EmailChannel.new(email_channel_params)

    respond_to do |format|
      if @email_channel.save
        format.html { redirect_to @email_channel, notice: "Email channel was successfully created." }
        format.json { render :show, status: :created, location: @email_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_channels/1 or /email_channels/1.json
  def update
    respond_to do |format|
      if @email_channel.update(email_channel_params)
        format.html { redirect_to @email_channel, notice: "Email channel was successfully updated." }
        format.json { render :show, status: :ok, location: @email_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_channels/1 or /email_channels/1.json
  def destroy
    @email_channel.destroy!

    respond_to do |format|
      format.html { redirect_to email_channels_path, status: :see_other, notice: "Email channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_channel
      @email_channel = EmailChannel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def email_channel_params
      params.expect(email_channel: %i[enabled email_address])
    end
end
