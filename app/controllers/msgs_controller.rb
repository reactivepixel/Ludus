class MsgsController < ApplicationController
  before_action :set_msg, only: [:show, :edit, :update, :destroy]

  # requires login to do everything below except...
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html

  def index
    @msgs = Msg.all
    respond_with(@msgs)
  end

  def show
    respond_with(@msg)
  end

  def new
    @msg = current_user.msg.build
    @channels = Channel.all

    respond_with(@msg)
  end

  def edit
    @channels = Channel.all
  end

  def create
    @msg = current_user.msg.build(msg_params)
    @msg.save
    respond_with(@msg)
  end

  def update
    @msg.update(msg_params)
    respond_with(@msg)
  end

  def destroy
    @msg.destroy
    respond_with(@msg)
  end



  private
    def set_msg
      @msg = Msg.find(params[:id])
    end

    def msg_params
      params.require(:msg).permit(:content, :channel_id)
    end
end