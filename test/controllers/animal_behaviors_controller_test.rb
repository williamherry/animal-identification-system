require 'test_helper'

class AnimalBehaviorsControllerTest < ActionController::TestCase
  setup do
    @animal_behavior = animal_behaviors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animal_behaviors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal_behavior" do
    assert_difference('AnimalBehavior.count') do
      post :create, animal_behavior: { behavior: @animal_behavior.behavior, code: @animal_behavior.code }
    end

    assert_redirected_to animal_behavior_path(assigns(:animal_behavior))
  end

  test "should show animal_behavior" do
    get :show, id: @animal_behavior
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animal_behavior
    assert_response :success
  end

  test "should update animal_behavior" do
    patch :update, id: @animal_behavior, animal_behavior: { behavior: @animal_behavior.behavior, code: @animal_behavior.code }
    assert_redirected_to animal_behavior_path(assigns(:animal_behavior))
  end

  test "should destroy animal_behavior" do
    assert_difference('AnimalBehavior.count', -1) do
      delete :destroy, id: @animal_behavior
    end

    assert_redirected_to animal_behaviors_path
  end
end
