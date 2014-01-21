class AddCommentsCount < ActiveRecord::Migration

  def self.up
    add_column :stories, :comments_count, :integer, :default => 0
  end

  def self.down
    remove_column :stories, :comments_count
  end
end
