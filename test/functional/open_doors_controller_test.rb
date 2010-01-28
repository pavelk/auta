require File.dirname(__FILE__) + '/../test_helper'
require 'open_doors_controller'

# Re-raise errors caught by the controller.
class OpenDoorsController; def rescue_action(e) raise e end; end

class OpenDoorsControllerTest < Test::Unit::TestCase
  fixtures :open_doors

  def setup
    @controller = OpenDoorsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:open_doors)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_open_door
    old_count = OpenDoor.count
    post :create, :open_door => { }
    assert_equal old_count+1, OpenDoor.count
    
    assert_redirected_to open_door_path(assigns(:open_door))
  end

  def test_should_show_open_door
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_open_door
    put :update, :id => 1, :open_door => { }
    assert_redirected_to open_door_path(assigns(:open_door))
  end
  
  def test_should_destroy_open_door
    old_count = OpenDoor.count
    delete :destroy, :id => 1
    assert_equal old_count-1, OpenDoor.count
    
    assert_redirected_to open_doors_path
  end
end
