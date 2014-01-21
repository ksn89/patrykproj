class AddConfirmationTokenToMembers < ActiveRecord::Migration
  def change
    add_column :members, :confirmation_token, :string
    add_column :members, :confirmed, :boolean, default: false
  end
end
