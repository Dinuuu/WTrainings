class AddKindToTraining < ActiveRecord::Migration[5.1]
  def change
    add_column :trainings, :kind, :integer
  end
end
