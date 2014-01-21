class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.integer :project_id
      t.string :status
      t.text :description
      t.string :story_type
      t.string :owner

      t.timestamps
    end
  end
end
