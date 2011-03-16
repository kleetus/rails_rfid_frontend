require 'test_helper'

class RfiduserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Rfiduser.new.valid?
  end
end
