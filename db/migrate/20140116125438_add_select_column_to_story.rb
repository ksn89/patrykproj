class AddSelectColumnToStory < ActiveRecord::Migration
  def change
    add_column :stories, :select, :string
  end
end
