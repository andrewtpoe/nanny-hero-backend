require 'test_helper'

class Api::FamilyControllerTest < ActionController::TestCase
  def setup
    @family = families(:one)
  end

  test 'GET #index' do
    get :index, format: :json
    assert_response 200
    r = JSON.parse(response.body, symbolize_names: true)[0]
    ['id', 'name', 'phone_number', 'address', 'picture'].each do |item|
      assert_equal @family.send(item), r[item.to_sym]
    end
  end

  test 'GET #show renders correct data' do
    get :show, id: @family, format: :json
    assert_response 200
    r = JSON.parse(response.body, symbolize_names: true)
    ['id', 'name', 'phone_number', 'address', 'picture'].each do |item|
      assert_equal @family.send(item), r[item.to_sym]
    end
  end

  test 'POST #create works with valid attributes' do
    attributes = { name: 'test_name', phone_number: 'test_phone_number', address: 'test_address' }
    assert_difference('Family.count', 1) do
      post :create, family: attributes, format: :json
    end
    assert_response 201
  end

  test 'POST #create does not work with invalid attributes' do
    attributes = { name: '', phone_number: '', address: '' }
    assert_no_difference('Family.count') do
      post :create, family: attributes, format: :json
    end
    assert_response 422
  end

  test 'PATCH #update works with valid attributes' do
    attributes = { name: 'test_name', phone_number: 'test_phone_number', address: 'test_address' }
    patch :update, id: @family, family: attributes, format: :json
    assert_response 200
    @family.reload
    r = JSON.parse(response.body, symbolize_names: true)
    ['id', 'name', 'phone_number', 'address', 'picture'].each do |item|
      assert_equal @family.send(item), r[item.to_sym]
    end
  end

  test 'PATCH #update does not work with INvalid attributes' do
    attributes = { name: '', phone_number: '', address: '' }
    patch :update, id: @family, family: attributes, format: :json
    assert_response 422
    @family.reload
    r = JSON.parse(response.body, symbolize_names: true)
    ['id', 'name', 'phone_number', 'address', 'picture'].each do |item|
      assert_not_equal @family.send(item), r[item.to_sym]
    end
  end

  test 'DELETE #destroy obliterates family object' do
    assert_difference('Family.count', -1) do
      delete :destroy, id: @family, format: :json
    end
    assert_response 204
    begin
      check = Family.find(id: @family.id)
    rescue
      check = nil
    end
    refute check
  end

end
