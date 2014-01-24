require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  fixtures :projects

  def setup
    @p = projects(:Project1)
  end


  should have_many(:stories)
  should validate_uniqueness_of(:name)
  should ensure_length_of(:name).is_at_most(15)

  test "invalid name gives error message" do
    @p.name = nil
    assert_presence(@p, :name)
  end

  test "invalid username gives error message" do
    @p.user_name = nil
    assert_presence(@p, :user_name)
  end

  test "should respond to member" do
    assert_respond_to @p, :members
  end

  test "should contain only members that belong to project" do
    assert @p.members.all? { |t| t.project == @p }
  end


end