class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :task_field
      t.integer :story_id

      t.timestamps
    end
  end
end
