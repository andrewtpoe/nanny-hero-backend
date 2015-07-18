require 'test_helper'

class Api::NannyControllerTest < ActionController::TestCase
  def setup
    @family = families(:poes)
    @nanny = nannies(:nancy)
    @n_attr = {
      name: "George"
    }
  end

  test 'GET #show returns correct data when passed :name' do
    get :show, id: @nanny.name, format: :json
    assert_response 200
    r = JSON.parse(response.body, symbolize_names: true)
    assert_equal @nanny.send('name'), r[:name]
    assert @nanny.families
  end

  test 'GET #show does not render correct data without valid :name' do
    get :show, id: "boogy22", format: :json
    assert_response 404
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
      delete :destroy, id: @nanny.name, format: :json
    end
    assert_response 200
    begin
      check = Nanny.find(@nanny.id)
    rescue
      check = nil
    end
    refute check
  end

end
