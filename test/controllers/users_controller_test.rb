require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get create_dailyplate' do
    get :create_dailyplate
    assert_response :success
  end

  test 'should get create_recurringplate' do
    get :create_recurringplate
    assert_response :success
  end
end
