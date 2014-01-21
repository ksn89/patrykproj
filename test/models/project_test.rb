require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  fixtures :projects
  test "project attributes must not be empty" do
    project = Project.new
    assert project.invalid?
    assert project.errors[:name].any?
    assert project.errors[:user_name].any?
  end
  test "project is not valid without a unique name" do
    project = Project.new(name: projects(:ruby).name, user_name: "ksn89@o2.pl")
    assert project.invalid?
    assert_equal ["has already been taken"], project.errors[:name]
  end
end