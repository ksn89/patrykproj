class AddTasksCount < ActiveRecord::Migration
  def self.up
    add_column :stories, :tasks_count, :integer, :default => 0
  end

  def self.down
    remove_column :stories, :tasks_count
  end
end
