require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "member attributes must not be empty" do
    member = Member.new
    assert member.invalid?
    assert member.errors[:member_name].any?
    assert member.errors[:email_member].any?
    assert member.errors[:project_id].any?
  end

end