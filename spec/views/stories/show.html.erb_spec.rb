require 'spec_helper'

describe "stories/show" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :name => "Name",
      :project_id => 1,
      :status => "Status",
      :description => "MyText",
      :story_type => "Story Type",
      :owner => "Owner"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Status/)
    rendered.should match(/MyText/)
    rendered.should match(/Story Type/)
    rendered.should match(/Owner/)
  end
end
