class CreateTrainingUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :training_users do |t|
      t.references :training, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
