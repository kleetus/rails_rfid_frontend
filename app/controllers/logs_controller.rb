class LogsController < ApplicationController
  def index
    @entries = Log.find(:all, :conditions => "created_at>'#{(Time.now-14.days).strftime("%Y-%m-%d")}'")
  end
  
  def search
  end
end
