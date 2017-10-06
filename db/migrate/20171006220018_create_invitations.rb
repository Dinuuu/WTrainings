class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :training_session, foreign_key: true
      t.integer :status
      t.timestamps
    end
  end
end
