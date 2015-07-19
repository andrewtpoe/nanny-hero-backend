require 'test_helper'

class Api::ChildControllerTest < ActionController::TestCase
  def setup
    @family = families(:poes)
    @child = children(:one)
    @c_attr = {
      name: "Tommy",
      age: "10",
      allergies: "none",
      fav_food: "Mac 'n Cheese",
      interests: "Child interests",
      bed_time: "9pm",
      potty_trained: "true",
      special_needs: "false"
    }
  end

  test 'POST #create builds a new child object' do
    assert_difference('Child.count', 1) do
      post :create, family_id: @family.name, child: @c_attr, format: :json
      assert_response 201
    end
  end

  test 'DELETE #destroy obliterates a child record' do
    assert_difference('Child.count', -1) do
      delete :destroy, family_id: @child.family, id: @child, format: :json
    end
    assert_response 204
    begin
      check = Child.find(@child.id)
    rescue
      check = nil
    end
    refute check
  end

end
