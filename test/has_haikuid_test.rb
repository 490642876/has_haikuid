require "test_helper"

class HasHaikuidTest < MiniTest::Test
  def setup
    @user = User.new
  end

  def test_id_values_are_generated_for_specified_attributes_and_persisted_on_save
    @user.save
    refute_nil @user.id
    refute_nil @user.oid
    assert_equal 3, @user.id.split('-').size
  end

end
