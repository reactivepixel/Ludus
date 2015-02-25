class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  #helper_method :count
  respond_to :html
  #before_filter :authenticate_user!

  def index
    @channels = Channel.all
    @channel = Channel.new
    @msgs = Msg.all
    @msgs = Msg.order(created_at: :desc).limit(5)
    respond_with(@channels, @channel)
  end

  def show
    @msgs = Msg.where(:channel_id => @channel.id)

    #validates if user is logged in and renders the view accordingly
    if current_user!=nil
      @msg = current_user.msg.build
      respond_with(:msg=> @msg)
    else

  end
end

  def new
    @channel = Channel.new
    @post = Post.new
    respond_with(@channel, @post)

  end

  def edit
  end

  def create
    @channel = Channel.new(channel_params)
    @channel.save
    respond_with(@channel)
  end

  def update
    @channel.update(channel_params)
    respond_with(@channel)
  end

  def destroy
    @channel.destroy
    respond_with(@channel)
  end


  private
    def set_channel
      @channel = Channel.find(params[:id])
    end

    def channel_params
      params.require(:channel).permit(:title)
    end
end
