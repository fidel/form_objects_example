require 'test_helper'

class SignupsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    assert_difference('User.count') do
      assert_difference('Company.count') do
        post :create, "company"=>{"name"=>"Random company", "users_attributes"=>{"0"=>{"email"=>"john@example.com", "name"=>"John"}}}
      end
    end
    assert_redirected_to new_signup_path
  end

  test "should get new when failed" do
    assert_difference('Company.count', 0) do
      post :create, "company" => { "name" => '', "users_attributes" => { "0" => { "email" => 'random@example.com', "name" => 'Ranom guy' } } }
    end

    assert_response :success
  end

  test "should get new when email exists" do
    users(:one)

    assert_difference('Company.count', 0) do
      post :create, "company" => { "name" => 'Random company', "users_attributes" => { "0" => { "email" => users(:one).email, "name" => 'Joe' } } }
    end

    assert_response :success
  end
end
