require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  should validate_presence_of(:body)
  should belong_to(:user)
  should belong_to(:story)
  should ensure_length_of(:body).is_at_most(128)

end