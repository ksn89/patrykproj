require 'test_helper'

class StoryTest < ActiveSupport::TestCase


  should validate_presence_of(:name)
  should validate_presence_of(:project_id)
  should validate_presence_of(:status)
  should validate_presence_of(:owner)
  should validate_presence_of(:story_type)
  should validate_presence_of(:description)
  should validate_presence_of(:select)
  should ensure_length_of(:name).is_at_most(15)
  should belong_to(:project)
  should have_many(:comments)
  should have_many(:tasks)
  should ensure_inclusion_of(:status).in_array(%w(Unstarted Started Finished Delivered Accepted Rejected))
end