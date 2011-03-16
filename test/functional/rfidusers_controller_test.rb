require 'test_helper'

class RfidusersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Rfiduser.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Rfiduser.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Rfiduser.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to rfiduser_url(assigns(:rfiduser))
  end
end
