require "test_helper"

class OccupationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @occupation = occupations(:one)
  end

  test "should get index" do
    get occupations_url, as: :json
    assert_response :success
  end

  test "should create occupation" do
    assert_difference('Occupation.count') do
      post occupations_url, params: { occupation: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show occupation" do
    get occupation_url(@occupation), as: :json
    assert_response :success
  end

  test "should update occupation" do
    patch occupation_url(@occupation), params: { occupation: {  } }, as: :json
    assert_response 200
  end

  test "should destroy occupation" do
    assert_difference('Occupation.count', -1) do
      delete occupation_url(@occupation), as: :json
    end

    assert_response 204
  end
end
