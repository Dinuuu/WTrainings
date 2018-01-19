class AddTypeToTrainings < ActiveRecord::Migration[5.1]
  def change
    add_column :trainings, :t_type, :integer, null: false, default: 0
  end
end
