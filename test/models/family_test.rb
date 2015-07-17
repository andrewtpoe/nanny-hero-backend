require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  def setup
    @family = families(:one)
  end

  test "fixture is valid" do
    assert @family.valid?
  end

  test "is invalid without name" do
    @family.name = nil
    refute @family.valid?
    assert @family.errors.keys.include?(:name)
  end

  test "is invalid without phone_number" do
    @family.phone_number = nil
    refute @family.valid?
    assert @family.errors.keys.include?(:phone_number)
  end

  test "is invalid without address" do
    @family.address = nil
    refute @family.valid?
    assert @family.errors.keys.include?(:address)
  end

end
