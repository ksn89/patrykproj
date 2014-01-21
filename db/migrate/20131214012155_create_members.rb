class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :project_id
      t.string :member_name



      t.timestamps
    end
  end
end
