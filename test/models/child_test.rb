require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  def setup
    @child = children(:one)
  end

  test "fixture is valid" do
    assert @child.valid?
  end

  test "is invalid without name" do
    @child.name = nil
    refute @child.valid?
    assert @child.errors.keys.include?(:name)
  end

  test "is invalid without family_id" do
    @child.family_id = nil
    refute @child.valid?
    assert @child.errors.keys.include?(:family_id)
  end

end
