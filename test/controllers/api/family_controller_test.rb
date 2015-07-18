require 'test_helper'

class Api::FamilyControllerTest < ActionController::TestCase
  def setup
    @family = families(:poes)
    @f_attr = {
      name: "unique family name",
      phone_number: "888-888-8888",
      address: "family's address",
      picture: "link to picture",
      nanny: "Thomas",
      nanny_id: nil,
      children: [
        {
          name: "Tommy",
          age: 10,
          allergies: "none",
          fav_food: "Mac 'n Cheese",
          interests: "Child interests",
          bed_time: "9pm",
          potty_trained: "true",
          special_needs: "false"
        }
      ]
    }
    @child = children(:one)
  end

  test 'GET #index' do
    get :index, format: :json
    assert_response 200
    resp = JSON.parse(response.body, symbolize_names: true)
    r = resp[:families][0]
    ['name', 'phone_number', 'address', 'picture'].each do |item|
      assert_equal @family.send(item), r[item.to_sym]
    end
  end

  test 'GET #show returns correct data when passed :name' do
    get :show, id: @family.name, format: :json
    assert_response 200
    r = JSON.parse(response.body, symbolize_names: true)
    ['name', 'phone_number', 'address', 'picture'].each do |item|
      assert_equal @family.send(item), r[item.to_sym]
    end
  end

  test 'GET #show does not render correct data without valid :name' do
    get :show, id: "boogy22", format: :json
    assert_response 404
  end

  test 'POST #create builds family record with valid attributes' do
    assert_difference('Family.count', 1) do
      post :create, family: @f_attr, format: :json
    end
    assert_response 201
  end

  test 'POST #create does not build family record with invalid attributes' do
    attributes = { name: '', phone_number: '', address: '' }
    assert_no_difference('Family.count') do
      post :create, family: attributes, format: :json
    end
    assert_response 422
  end

  test 'POST #create creates the correct number of child records with valid attributes' do
    assert_difference('Child.count', 1) do
      post :create, family: @f_attr, format: :json
    end
    assert_response 201
  end

  test 'POST #create does not create child records with INvalid attributes' do
    attributes = { name: '', phone_number: '', address: '' }
    assert_no_difference('Family.count') do
      post :create, family: attributes, format: :json
    end
    assert_response 422
  end





  test 'POST #create creates nanny record associated with family' do
    assert_difference('Nanny.count', 1) do
      post :create, family: @f_attr, format: :json
    end
    assert_response 201
  end

  test 'POST #create does not work without nanny name' do
  end





  test 'PATCH #update works with valid attributes' do
    patch :update, id: @family.name, family: @f_attr, format: :json
    assert_response 201
  end

  test 'PATCH #update does not work with INvalid attributes' do
    attributes = { name: '', phone_number: '', address: '' }
    patch :update, id: @family.name, family: attributes, format: :json
    assert_response 422
  end

  test 'DELETE #destroy obliterates family object' do
    assert_difference('Family.count', -1) do
      delete :destroy, id: @family.name, format: :json
    end
    assert_response 200
    begin
      check = Family.find(id: @family.id)
    rescue
      check = nil
    end
    refute check
  end

  test 'DELETE #destroy family also deletes related children' do
    @child.family = @family
    @child.save
    id = @child.id
    @family.destroy
    refute Child.find_by(id: id)
  end

end
