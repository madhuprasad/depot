require 'test_helper'

class AdminControllerTest < ActionController::TestCase


  fixtures :users
  

  # Replace this with your real tests.
  def the_truth
    assert true
  end

  
  if false
    
    def index
      get :index 
      assert_response :success 
    end
    
  end

  
  def index_without_user
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in", flash[:notice]
  end
  

  
  def index_with_user
    get :index, {}, { :user_id => users(:dave).id }
    assert_response :success
    assert_template "index"
  end
  
 
  
  def login 
    dave = users(:dave)
    post :login, :name => dave.name, :password => 'secret'
    assert_redirected_to :action => "index"
    assert_equal dave.id, session[:user_id]
  end
  

  
  def bad_password
    dave = users(:dave)
    post :login, :name => dave.name, :password => 'wrong'
    assert_template "login"
  end
  

end
