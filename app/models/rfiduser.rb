class Rfiduser < ActiveRecord::Base
  attr_accessible :name, :address, :cardid
end
