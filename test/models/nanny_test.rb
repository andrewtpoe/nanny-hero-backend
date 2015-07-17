require 'test_helper'

class NannyTest < ActiveSupport::TestCase
  def setup
    @nanny = nannies(:one)
  end

  test "fixture is valid" do
    assert @nanny.valid?
  end

  test "is invalid without name" do
    @nanny.name = nil
    refute @nanny.valid?
    assert @nanny.errors.keys.include?(:name)
  end


end
