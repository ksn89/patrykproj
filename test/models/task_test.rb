require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "task attributes must not be empty" do
    task = Task.new
    assert task.invalid?
    assert task.errors[:task_field].any?
  end

end