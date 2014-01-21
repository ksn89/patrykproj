class AddEmailMemberToMembers < ActiveRecord::Migration
  def change
    add_column :members, :email_member, :string
  end
end
