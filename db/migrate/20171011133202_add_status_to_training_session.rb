class AddStatusToTrainingSession < ActiveRecord::Migration[5.1]
  def change
    add_column :training_sessions, :status, :integer
  end
end
