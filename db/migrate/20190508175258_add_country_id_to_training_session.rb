class AddCountryIdToTrainingSession < ActiveRecord::Migration[5.1]
  def change
    add_reference :training_sessions, :country, index: true
  end
end