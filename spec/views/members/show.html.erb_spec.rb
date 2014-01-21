require 'spec_helper'

describe "members/show" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :member_name => "Member Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Member Name/)
  end
end
