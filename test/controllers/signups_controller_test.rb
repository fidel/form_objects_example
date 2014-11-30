require 'test_helper'

class SignupsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    assert_difference('User.count') do
      assert_difference('Company.count') do
        post :create, "signup"=>{"company_name"=>"Random company", "email"=>"john@example.com", "name"=>"John"}
      end
    end
    assert_redirected_to new_signup_path
  end

  test "should get new when failed" do
    assert_difference('Company.count', 0) do
      post :create, "signup"=>{"company_name"=>"", "email"=>"john@example.com", "name"=>"John"}
    end

    assert_response :success
  end

  test "should get new when email exists" do
    assert_difference('Company.count', 0) do
      post :create, "signup"=>{"company_name"=>"", "email"=>users(:one).email, "name"=>"John"}
    end

    assert_response :success
  end
end
