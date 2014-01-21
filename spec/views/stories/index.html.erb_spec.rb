require 'spec_helper'

describe "stories/index" do
  before(:each) do
    assign(:stories, [
      stub_model(Story,
        :name => "Name",
        :project_id => 1,
        :status => "Status",
        :description => "MyText",
        :story_type => "Story Type",
        :owner => "Owner"
      ),
      stub_model(Story,
        :name => "Name",
        :project_id => 1,
        :status => "Status",
        :description => "MyText",
        :story_type => "Story Type",
        :owner => "Owner"
      )
    ])
  end

  it "renders a list of stories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Story Type".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
  end
end
