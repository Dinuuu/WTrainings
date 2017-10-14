class AddDefaultStatusToInvitation < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :invitations, :status, 0
  end
end
