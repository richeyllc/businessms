require 'test_helper'

class PhoneNumbersControllerTest < ActionController::TestCase
  setup do
    @phone_number = phone_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phone_number" do
    assert_difference('PhoneNumber.count') do
      post :create, phone_number: { customer_id: @phone_number.customer_id, customer_metadata: @phone_number.customer_metadata, number: @phone_number.number, our_metadata: @phone_number.our_metadata, ours: @phone_number.ours }
    end

    assert_redirected_to phone_number_path(assigns(:phone_number))
  end

  test "should show phone_number" do
    get :show, id: @phone_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phone_number
    assert_response :success
  end

  test "should update phone_number" do
    patch :update, id: @phone_number, phone_number: { customer_id: @phone_number.customer_id, customer_metadata: @phone_number.customer_metadata, number: @phone_number.number, our_metadata: @phone_number.our_metadata, ours: @phone_number.ours }
    assert_redirected_to phone_number_path(assigns(:phone_number))
  end

  test "should destroy phone_number" do
    assert_difference('PhoneNumber.count', -1) do
      delete :destroy, id: @phone_number
    end

    assert_redirected_to phone_numbers_path
  end
end
