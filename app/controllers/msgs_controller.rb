class MsgsController < ApplicationController
  before_action :set_msg, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @msgs = Msg.all
    respond_with(@msgs)
  end

  def show
    respond_with(@msg)
  end

  def new
    @msg = Msg.new
    respond_with(@msg)
  end

  def edit
  end

  def create
    @msg = Msg.new(msg_params)
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
      params.require(:msg).permit(:content)
    end
end
