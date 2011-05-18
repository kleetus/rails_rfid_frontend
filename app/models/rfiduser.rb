class Rfiduser < ActiveRecord::Base
  def toggle
    self.activated==1 ? self.activated=0 : self.activated=1
  end
end
