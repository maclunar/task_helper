class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.boolean :finished
      t.datetime :time_finished
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
