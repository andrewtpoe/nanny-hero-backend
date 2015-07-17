require 'test_helper'

class Api::ChildControllerTest < ActionController::TestCase
  def setup
    @family = families(:one)
    @child = children(:one)
    @c_attr = {
      name: "Tommy",
      age: 10,
      allergies: "none",
      fav_food: "Mac 'n Cheese",
      interests: "Child interests",
      bed_time: "9pm",
      potty_trained: "true",
      special_needs: "false"
    }
  end

  test 'POST #create builds a new child objext' do
    assert_difference('Child.count', 1) do
      post :create, family: @family, child: @c_attr, format: :json
    end
  end

  test 'DELETE #destroy removes a child record' do
  end


end
