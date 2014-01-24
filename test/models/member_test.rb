require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  should validate_presence_of(:member_name)
  should validate_presence_of(:email_member)
  should allow_value("a@b.com").for(:email_member)
  should belong_to(:project)
  should allow_value(true).for(:project_owner)
  should allow_value(false).for(:project_owner)


end