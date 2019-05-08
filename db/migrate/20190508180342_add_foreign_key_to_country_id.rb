class AddForeignKeyToCountryId < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :training_sessions, :countries
  end
end
