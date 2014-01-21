require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  test "Story attributes must not be empty" do
    story = Story.new
    assert story.invalid?
    assert story.errors[:name].any?
    assert story.errors[:project_id].any?
    assert story.errors[:status].any?
    assert story.errors[:owner].any?
    assert story.errors[:story_type].any?
    assert story.errors[:description].any?
    assert story.errors[:select].any?
  end

end