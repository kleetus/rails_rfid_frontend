class RfidusersController < ApplicationController
  def index
    @rfidusers = Rfiduser.all
  end

  def show
    @rfiduser = Rfiduser.find(params[:id])
  end

  def deactivate
    redirect_to :back
  end
  
  def new
    @rfiduser = Rfiduser.new
  end

  def create
    @rfiduser = Rfiduser.new(params[:rfiduser])
    if @rfiduser.save
      redirect_to @rfiduser, :notice => "Successfully created rfiduser."
    else
      render :action => 'new'
    end
  end
end
