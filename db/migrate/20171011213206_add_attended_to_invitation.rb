class AddAttendedToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :attended, :boolean, default: false, null: false
  end
end
