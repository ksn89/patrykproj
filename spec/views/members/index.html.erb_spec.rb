require 'spec_helper'

describe "members/index" do
  before(:each) do
    assign(:members, [
      stub_model(Member,
        :member_name => "Member Name"
      ),
      stub_model(Member,
        :member_name => "Member Name"
      )
    ])
  end

  it "renders a list of members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Member Name".to_s, :count => 2
  end
end
