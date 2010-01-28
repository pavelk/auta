require File.dirname(__FILE__) + '/../test_helper'
require 'schools_controller'

# Re-raise errors caught by the controller.
class SchoolsController; def rescue_action(e) raise e end; end

class SchoolsControllerTest < Test::Unit::TestCase
  fixtures :schools

  def setup
    @controller = SchoolsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:schools)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_school
    old_count = School.count
    post :create, :school => { }
    assert_equal old_count+1, School.count
    
    assert_redirected_to school_path(assigns(:school))
  end

  def test_should_show_school
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_school
    put :update, :id => 1, :school => { }
    assert_redirected_to school_path(assigns(:school))
  end
  
  def test_should_destroy_school
    old_count = School.count
    delete :destroy, :id => 1
    assert_equal old_count-1, School.count
    
    assert_redirected_to schools_path
  end
end
