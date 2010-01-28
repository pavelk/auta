require File.dirname(__FILE__) + '/../test_helper'
require 'hints_controller'

# Re-raise errors caught by the controller.
class HintsController; def rescue_action(e) raise e end; end

class HintsControllerTest < Test::Unit::TestCase
  fixtures :hints

  def setup
    @controller = HintsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:hints)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_hint
    old_count = Hint.count
    post :create, :hint => { }
    assert_equal old_count+1, Hint.count
    
    assert_redirected_to hint_path(assigns(:hint))
  end

  def test_should_show_hint
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_hint
    put :update, :id => 1, :hint => { }
    assert_redirected_to hint_path(assigns(:hint))
  end
  
  def test_should_destroy_hint
    old_count = Hint.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Hint.count
    
    assert_redirected_to hints_path
  end
end
