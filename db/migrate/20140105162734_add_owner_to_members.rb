class AddOwnerToMembers < ActiveRecord::Migration
  def change
    add_column :members, :project_owner, :boolean
  end
end
