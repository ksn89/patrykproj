require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  should validate_presence_of(:task_field)
  should belong_to(:user)
  should belong_to(:story)
  should ensure_length_of(:task_field).is_at_most(128)

end