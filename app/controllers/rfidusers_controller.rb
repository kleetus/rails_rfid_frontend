class RfidusersController < ApplicationController
  before_filter :login_required
  
  def index
    @rfidusers = Rfiduser.all
    @total = @rfidusers.length
    @deactive = 0
    @rfidusers.collect! do |u|
      @deactive+=1 if u.activated==0
      if !params.has_key? "activated" or u.activated == params[:activated].to_i
        u
      end
    end.compact!  
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