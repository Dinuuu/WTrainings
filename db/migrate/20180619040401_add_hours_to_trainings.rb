class AddHoursToTrainings < ActiveRecord::Migration[5.1]
  def change
    add_column :trainings, :duration, :float
  end
end
