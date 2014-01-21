require 'spec_helper'

describe "stories/new" do
  before(:each) do
    assign(:story, stub_model(Story,
      :name => "MyString",
      :project_id => 1,
      :status => "MyString",
      :description => "MyText",
      :story_type => "MyString",
      :owner => "MyString"
    ).as_new_record)
  end

  it "renders new story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stories_path, "post" do
      assert_select "input#story_name[name=?]", "story[name]"
      assert_select "input#story_project_id[name=?]", "story[project_id]"
      assert_select "input#story_status[name=?]", "story[status]"
      assert_select "textarea#story_description[name=?]", "story[description]"
      assert_select "input#story_story_type[name=?]", "story[story_type]"
      assert_select "input#story_owner[name=?]", "story[owner]"
    end
  end
end
