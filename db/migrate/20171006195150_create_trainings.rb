class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :feedback_form
      t.string :program
      t.string :slides
      t.text :objective
      t.timestamps
    end
  end
end
