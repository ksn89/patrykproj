require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :user_id => 1,
      :task_field => "MyText",
      :story_id => 1
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_user_id[name=?]", "task[user_id]"
      assert_select "textarea#task_task_field[name=?]", "task[task_field]"
      assert_select "input#task_story_id[name=?]", "task[story_id]"
    end
  end
end
