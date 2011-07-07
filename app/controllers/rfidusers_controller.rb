class RfidusersController < ApplicationController
  before_filter :login_required, :except => 'dumpdb'
  
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
  
  def search
    @rfidusers = Rfiduser.all
    @rfidusers.collect! do |u|
      u if u.name =~ %r{#{params[:name]}}i
    end.compact!  
    render :action => :index
  end
  
  def dumpdb
    render :text => Rfiduser.all.reject{|u| u.cardid.nil? or u.cardid == "" }.collect{|u| "#{u.cardid}#{u.activated}"}.join("\n")
  end
  
  def edit
    @rfiduser = Rfiduser.find(params[:id])
  end

  def update
    @rfiduser = Rfiduser.find(params[:id])
    @rfiduser.update_attributes(params[:rfiduser])
    if @rfiduser.save
      flash[:notice] = "User's info saved."
    else
      flash[:notice] = "Error. Try again and make sure all fields are filled in."
    end
    redirect_to rfidusers_url
  end
  
  def toggle
    @rfiduser = Rfiduser.find(params[:id])
    return unless @rfiduser
    @rfiduser.toggle
    de = @rfiduser.activated==0 ? "de" : ""
    flash.notice = "#{@rfiduser.name} was #{de}activated." if @rfiduser.save
    redirect_to :back
  end  
end
