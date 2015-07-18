require 'test_helper'

class Api::NannyControllerTest < ActionController::TestCase
  def setup
    @family = families(:poes)
    @nanny = nannies(:nancy)
    @n_attr = {
      name: "George"
    }
  end

  test 'POST #create builds a new nanny object' do
    assert_difference('Nanny.count', 1) do
      post :create, nanny: @n_attr, format: :json
      r = JSON.parse(response.body, symbolize_names: true)
      assert_equal @n_attr[:name], r[:name]
    end
  end

  test 'DELETE #destroy obliterates a nanny record' do
    assert_difference('Nanny.count', -1) do
      delete :destroy, id: @nanny, format: :json
    end
    assert_response 204
    begin
      check = Nanny.find(@nanny.id)
    rescue
      check = nil
    end
    refute check
  end

end
