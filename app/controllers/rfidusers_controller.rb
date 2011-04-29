class RfidusersController < ApplicationController
  def index
    @rfidusers = Rfiduser.all
  end
  
  def dumpdb
    render :text => Rfiduser.all.reject{|u| u.cardid.nil?}.collect{|u| "#{u.cardid}#{u.activated}"}.join("\n")
  end

  def show
    @rfiduser = Rfiduser.find(params[:id])
  end

  def toggle
    @rfiduser = Rfiduser.find(params[:id])
    return unless @rfiduser
    @rfiduser.toggle
    de = @rfiduser.activated==0 ? "de" : ""
    flash.notice = "#{@rfiduser.name} was #{de}activated." if @rfiduser.save
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
