class AddTimeToTrainingSession < ActiveRecord::Migration[5.1]
  def change
    add_column :training_sessions, :time, :string
  end
end
